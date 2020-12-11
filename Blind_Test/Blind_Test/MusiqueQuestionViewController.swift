//
//  MusiqueQuestionViewController.swift
//  Blind-Test
//
//  Created by yann on 02/12/2020.
//  Copyright © 2020 Hugo. All rights reserved.
//

import AVFoundation
import UIKit

class MusiqueQuestionViewController: UIViewController {
    
    //Déclaration des variables
    @IBOutlet weak var titleQuestion: UILabel!
    @IBOutlet weak var btnTitre1: UIButton!
    @IBOutlet weak var btnTitre2: UIButton!
    @IBOutlet weak var btnTitre3: UIButton!
    @IBOutlet weak var btnTitre4: UIButton!
    @IBOutlet weak var btnChanteur1: UIButton!
    @IBOutlet weak var btnChanteur2: UIButton!
    @IBOutlet weak var btnChanteur3: UIButton!
    @IBOutlet weak var btnChanteur4: UIButton!
    @IBOutlet weak var btnNext: UIButton!
    var hasToPop = false
    var tempsRep: Float!
    
    //Score du joueur
    var score = 0
    
    var timer = Timer()
    
    //Instanciation des compteurs pour le Timer et le nombre de question
    var cptTimer = 0
    var cptQuestion = 0
    
    //Création d'une forme
    let shapeLayer = CAShapeLayer()
    
    //Composant qui permet de jouer les morceaux de musique
    var player: AVAudioPlayer?
    
    //Création de la classe "Question"
    struct Question: Equatable {
        static func ==(lhs: MusiqueQuestionViewController.Question, rhs: MusiqueQuestionViewController.Question) -> Bool {
            return lhs.musique == rhs.musique
        }
        
        let optionTitre : [String]
        let optionChanteur : [String]
        let correcteTitre : String
        let correcteChanteur : String
        let musique : String
        let uneReponse : Bool
    }
    
    //Création des questions
    let q1 = Question(optionTitre: ["Paradise", "Counting Stars", "A Sky Full Of Stars", "Vertigo"], optionChanteur: ["Maroon 5", "Coldplay", "U2", "OneRepublic"], correcteTitre: "A Sky Full Of Stars", correcteChanteur: "Coldplay", musique: "Coldplay - A Sky Full Of Stars", uneReponse: false)
    
    let q2 = Question(optionTitre: ["Airplanes", "Wolves", "Price Tag", "Only Girl"], optionChanteur: ["Rihanna", "Jessie J ft. B.o.B", "Selena Gomez", "B.o.B ft. Hayley Williams"], correcteTitre: "Airplanes", correcteChanteur: "B.o.B ft. Hayley Williams", musique: "B.o.B ft. Hayley Williams - Airplanes", uneReponse: false)
    
    let q3 = Question(optionTitre: ["Sirens Call", "Jimmy", "Jammy", "On My Own"], optionChanteur: ["Cats on Trees, Calogero", "Marina Kaye", "Louane", "Adele"], correcteTitre: "Jimmy", correcteChanteur: "Cats on Trees, Calogero", musique: "Cats on Trees, Calogero - Jimmy", uneReponse: false)
    
    let q4 = Question(optionTitre: ["Un homme debout", "Allez Reste", "Debout", "Dis-Le Moi"], optionChanteur: ["Renan Luce", "Grégoire", "Claudio Capeo", "Boulevard des Airs"], correcteTitre: "Un homme debout", correcteChanteur: "Claudio Capeo", musique: "Claudio Capeo -  Un homme debout", uneReponse: false)
    
    let q5 = Question(optionTitre: ["Tourner Les Serviettes", "Les Sardines", "Le Petit Bonhomme En Mousse", "On est serrés"], optionChanteur: ["Joe l'Éclate", "Sébastien Patoche", "Michaël Youn", "Patrick Sébastien"], correcteTitre: "Les Sardines", correcteChanteur: "Patrick Sébastien", musique: "Patrick Sébastien - Les sardines", uneReponse: false)
    
    let q6 = Question(optionTitre: ["Blank Space", "So What", "Shake It Off", "The Middle"], optionChanteur: ["Zedd, Maren Morris, Grey", "Taylor Swift", "Pink", "Zara Larsson"], correcteTitre: "Shake It Off", correcteChanteur: "Taylor Swift", musique: "Taylor Swift - Shake It Off", uneReponse: false)
    
    //Création du tableau contenant les questions dans l'ordre aléatoire
    var lesQuestionsRandom: [Question] = []
    
    //Variable permettant de vérifier que nous somme au début du quizz pour ne pas instancier le tableau de l'ordre aléatoire à chaque question
    var initRandomQuestion: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Arrondi des angles des boutons
        boutonArrondis()
        
        //Lance le Timer ainsi que la bare de progression
        initTimer()
        initBarTimer()
        
        //Met le Timer à 0 pour la prochaine question
        cptTimer = 0
        
        //Tableau contenant les questions
        var lesQuestions: [Question] = [q1, q2, q3, q4, q5, q6]
        
        //Verifie si on est à la premiere question
        if(initRandomQuestion){
            let nbQ = lesQuestions.count
        
            for i in 0...nbQ-1{
                var laQuestion = lesQuestions[Int(arc4random_uniform(UInt32(lesQuestions.count)))]
                while lesQuestionsRandom.contains(laQuestion) {
                    laQuestion = lesQuestions[Int(arc4random_uniform(UInt32(lesQuestions.count)))]
                }
            
                lesQuestionsRandom.append(laQuestion)
            }
        }
        
        //si le compteur est in férieur au nombre de question présent dans le tableau
        //afficher les options pour les titres et les chanteurs des questions
        //Sinon à la fin des questions on arrête de jouer la musique et on passe dans la page des résultats
        if(cptQuestion < lesQuestions.count){
            initTitres(lesQuestionsRandom[cptQuestion])
            initChanteur(lesQuestionsRandom[cptQuestion])
            initQuestion()
        }
        //Si toutes les questions ont été jouées, le joueur est redirigé vers la page de score et la musique s'arrete
        else{
            player?.stop()
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let resultatViewController = storyboard.instantiateViewController(withIdentifier: "ResultatViewController") as! ResultatViewController
            resultatViewController.score = score
            resultatViewController.nbQuestion = lesQuestions.count * 2
            resultatViewController.modalPresentationStyle = .fullScreen
            self.present(resultatViewController, animated: true) {
                self.hasToPop = true
            }
        }
        
        initRandomQuestion = false
        
    }
    
    //Arrondi des angles des boutons
    func boutonArrondis(){
        btnTitre1.layer.cornerRadius = 10.0
        btnTitre2.layer.cornerRadius = 10.0
        btnTitre3.layer.cornerRadius = 10.0
        btnTitre4.layer.cornerRadius = 10.0
        btnChanteur1.layer.cornerRadius = 10.0
        btnChanteur2.layer.cornerRadius = 10.0
        btnChanteur3.layer.cornerRadius = 10.0
        btnChanteur4.layer.cornerRadius = 10.0
        btnNext.layer.cornerRadius = 10.0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        if hasToPop {
            self.navigationController?.popToRootViewController(animated: false)
        }
    }
    
    func initTimer(){
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.compteur), userInfo: nil, repeats: true)
    }
    
    @objc func compteur(){
        //Si le joueur ne repond pas dans le temps impartis, le jeu passe à la question suivante et le joueur ne marque aucun point
        if(cptTimer == Int(tempsRep)){
            timer.invalidate()
            cptQuestion = cptQuestion + 1
            viewDidLoad()
        } else {
            cptTimer = cptTimer + 1
        }
        
    }
    
    func initBarTimer(){
        //Création du cercle qui va être utilisé pour le timer
        //Placé au centre de l'écran
        let center = view.center
        let circularPath = UIBezierPath(arcCenter: center, radius: 70, startAngle: -CGFloat.pi/2, endAngle: 2*CGFloat.pi - CGFloat.pi/2, clockwise: true)
        
        //Définition des caractéristiques du cercle
        //Donne la position du cercle
        shapeLayer.frame = CGRect(x: 0, y: -190, width: 0, height: 0)
        //Afectation de la forme cercle
        shapeLayer.path = circularPath.cgPath
        //Epaisseur du contour du cercle
        shapeLayer.lineWidth = 5
        //Couleur du contour
        shapeLayer.strokeColor = UIColor.red.cgColor
        //Donne la fin du contour
        shapeLayer.strokeEnd = 0
        //Enlève le fond noir du cercle
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineCap = kCALineCapRound
        
        //Ajoute le cercle à la vue
        view.layer.addSublayer(shapeLayer)
        //Permet de faire l'animation du contour du cercle
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        //Fait le tour du cercle
        basicAnimation.toValue = 1
        //Durée de l'animation
        basicAnimation.duration = Double(tempsRep)
        basicAnimation.fillMode = kCAFillModeForwards
        //Lorsque l'annimation est finie permet de mettre le contour à l'état initial
        basicAnimation.isRemovedOnCompletion = true
        shapeLayer.add(basicAnimation, forKey: "basicAnim")
    }
    
    //Cette fonction permet de jouer la musique
    func initQuestion(){
        
        //Donne le numéro de la question
        titleQuestion.text = "Question " + String(cptQuestion+1) + "/" + String(lesQuestionsRandom.count)
        
        let laQuestion = lesQuestionsRandom[cptQuestion]
        
        //Joue la musique de la question
        let urlString = Bundle.main.path(forResource: laQuestion.musique, ofType: "mp3")
        do {
            try AVAudioSession.sharedInstance().setMode("AVAudioSessionModeDefault")
            try AVAudioSession.sharedInstance().setActive(true, with: .notifyOthersOnDeactivation)
            
            guard let urlString = urlString else {
                return
            }
            
            player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString))
            
            guard let player = player else {
                return
            }
            
            player.play()
            
        }catch{
            print("Problems")
        }
    }
    
    //Affiche les propositions des titres et mets leur couleur en bleu
    func initTitres(_ newQuestion : Question){
        btnTitre1.setTitle(newQuestion.optionTitre[0], for: .normal)
        btnTitre2.setTitle(newQuestion.optionTitre[1], for: .normal)
        btnTitre3.setTitle(newQuestion.optionTitre[2], for: .normal)
        btnTitre4.setTitle(newQuestion.optionTitre[3], for: .normal)
        
        btnTitre1.backgroundColor = UIColor.blue
        btnTitre2.backgroundColor = UIColor.blue
        btnTitre3.backgroundColor = UIColor.blue
        btnTitre4.backgroundColor = UIColor.blue
        
        //L'utilisateur peux cliquer sur les boutons
        btnTitre1.isUserInteractionEnabled = true
        btnTitre2.isUserInteractionEnabled = true
        btnTitre3.isUserInteractionEnabled = true
        btnTitre4.isUserInteractionEnabled = true
    }
    
    //Affiche les propositions des chanteurs et mets leur couleur en bleu
    func initChanteur(_ newQuestion: Question){
        btnChanteur1.setTitle(newQuestion.optionChanteur[0], for: .normal)
        btnChanteur2.setTitle(newQuestion.optionChanteur[1], for: .normal)
        btnChanteur3.setTitle(newQuestion.optionChanteur[2], for: .normal)
        btnChanteur4.setTitle(newQuestion.optionChanteur[3], for: .normal)
        
        btnChanteur1.backgroundColor = UIColor.blue
        btnChanteur2.backgroundColor = UIColor.blue
        btnChanteur3.backgroundColor = UIColor.blue
        btnChanteur4.backgroundColor = UIColor.blue
        
        //L'utilisateur peux cliquer sur les boutons
        btnChanteur1.isUserInteractionEnabled = true
        btnChanteur2.isUserInteractionEnabled = true
        btnChanteur3.isUserInteractionEnabled = true
        btnChanteur4.isUserInteractionEnabled = true
    }
    
    //Passe à la question suivante lorsqu'on click sur le bouton "Next"
    @IBAction func clicNext(){
        timer.invalidate()
        cptQuestion = cptQuestion + 1
        viewDidLoad()
    }
    
    //Verifie si la réponse choisie parmis les titres est correcte ou non
    @IBAction func selectReponseTitre( sender: UIButton){
        let laQuestion = lesQuestionsRandom[cptQuestion]
        //Si la réponse est correcte, le bouton devient vert et le score du joueur s'incrémente de 1
        if(laQuestion.correcteTitre == sender.titleLabel?.text){
            sender.backgroundColor = UIColor.green
            score += 1
        }
        //Si la réponse est fausse, le bouton devient rouge et le joueur ne marque aucun point
        else {
            sender.backgroundColor = UIColor.red
        }
        //Désactive les boutons lorsqu'une réponse est choisie
        btnTitre1.isUserInteractionEnabled = false
        btnTitre2.isUserInteractionEnabled = false
        btnTitre3.isUserInteractionEnabled = false
        btnTitre4.isUserInteractionEnabled = false
        
    }
    
    //Verifie si la réponse choisie parmis les chanteurs est correcte ou non
    @IBAction func selectReponseChanteur( sender: UIButton){
        let laQuestion = lesQuestionsRandom[cptQuestion]
        //Si la réponse est correcte, le bouton devient vert et le score du joueur s'incrémente de 1
        if(laQuestion.correcteChanteur == sender.titleLabel?.text){
            sender.backgroundColor = UIColor.green
            score += 1
        }
        //Si la réponse est fausse, le bouton devient rouge et le joueur ne marque aucun point
        else {
            sender.backgroundColor = UIColor.red
        }
        //Désactive les boutons lorsqu'une réponse est choisie
        btnChanteur1.isUserInteractionEnabled = false
        btnChanteur2.isUserInteractionEnabled = false
        btnChanteur3.isUserInteractionEnabled = false
        btnChanteur4.isUserInteractionEnabled = false
        
    }
}
