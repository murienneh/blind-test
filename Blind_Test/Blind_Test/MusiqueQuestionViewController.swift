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
    
<<<<<<< HEAD
    @IBOutlet weak var btnPlay: UIButton!
=======
    //Déclaration des variables
    @IBOutlet weak var titleQuestion: UILabel!
>>>>>>> 4b00afc8cf9fdf01ace9ce83a899c8f7efb5de0e
    @IBOutlet weak var btnTitre1: UIButton!
    @IBOutlet weak var btnTitre2: UIButton!
    @IBOutlet weak var btnTitre3: UIButton!
    @IBOutlet weak var btnTitre4: UIButton!
    @IBOutlet weak var btnChanteur1: UIButton!
    @IBOutlet weak var btnChanteur2: UIButton!
    @IBOutlet weak var btnChanteur3: UIButton!
    @IBOutlet weak var btnChanteur4: UIButton!
    @IBOutlet weak var btnNext: UIButton!
<<<<<<< HEAD
=======
    var hasToPop = false
    var tempsRep: Float!
    var score = 0
    var timer = Timer()
    var cptTimer = 0
    var cptQuestion = 0
    //Création d'une forme
    let shapeLayer = CAShapeLayer()
>>>>>>> 4b00afc8cf9fdf01ace9ce83a899c8f7efb5de0e
    
    var player: AVAudioPlayer?
    
    struct Question {
        let optionTitre : [String]
        let optionChanteur : [String]
        let correcteTitre : String
        let correcteChanteur : String
        let musique : String
        let uneReponse : Bool
    }
    
<<<<<<< HEAD
    let q1 = Question(optionTitre: ["Oui", "ok", "A Sky Full Of Stars", "Salut"], optionChanteur: ["Joe", "Coldplay", "oui oui", "pompom"], correcteTitre: "A Sky Full Of Stars", correcteChanteur: "Coldplay", musique: "Coldplay - A Sky Full Of Stars", uneReponse: false)
    let q2 = Question(optionTitre: ["Non", "Airplanes", "jesaispas", "hey"], optionChanteur: ["Lala", "aaaaaa", "non non", "B.o.B ft. Hayley Williams"], correcteTitre: "Airplanes", correcteChanteur: "B.o.B ft. Hayley Williams", musique: "B.o.B ft. Hayley Williams - Airplanes", uneReponse: false)
    
    var cpt = 0
=======
    //Création des questions
    let q1 = Question(optionTitre: ["Paradise", "Counting Stars", "A Sky Full Of Stars", "Vertigo"], optionChanteur: ["Maroon 5", "Coldplay", "U2", "OneRepublic"], correcteTitre: "A Sky Full Of Stars", correcteChanteur: "Coldplay", musique: "Coldplay - A Sky Full Of Stars", uneReponse: false)
    
    let q2 = Question(optionTitre: ["Airplanes", "Wolves", "Price Tag", "Only Girl"], optionChanteur: ["Rihanna", "Jessie J ft. B.o.B", "Selena Gomez", "B.o.B ft. Hayley Williams"], correcteTitre: "Airplanes", correcteChanteur: "B.o.B ft. Hayley Williams", musique: "B.o.B ft. Hayley Williams - Airplanes", uneReponse: false)
    
    let q3 = Question(optionTitre: ["Sirens Call", "Jimmy", "Jammy", "On My Own"], optionChanteur: ["Cats on Trees, Calogero", "Marina Kaye", "Louane", "Adele"], correcteTitre: "Jimmy", correcteChanteur: "Cats on Trees, Calogero", musique: "Cats on Trees, Calogero - Jimmy", uneReponse: false)
    
    let q4 = Question(optionTitre: ["Un homme debout", "Allez Reste", "Debout", "Dis-Le Moi"], optionChanteur: ["Renan Luce", "Grégoire", "Claudio Capeo", "Boulevard des Airs"], correcteTitre: "Un homme debout", correcteChanteur: "Claudio Capeo", musique: "Claudio Capeo -  Un homme debout", uneReponse: false)
    
    let q5 = Question(optionTitre: ["Tourner Les Serviettes", "Les Sardines", "Le Petit Bonhomme En Mousse", "On est serrés"], optionChanteur: ["Joe l'Éclate", "Sébastien Patoche", "Michaël Youn", "Patrick Sébastien"], correcteTitre: "Les Sardines", correcteChanteur: "Patrick Sébastien", musique: "Patrick Sébastien - Les sardines", uneReponse: false)
    
    let q6 = Question(optionTitre: ["Blank Space", "So What", "Shake It Off", "The Middle"], optionChanteur: ["Zedd, Maren Morris, Grey", "Taylor Swift", "Pink", "Zara Larsson"], correcteTitre: "Shake It Off", correcteChanteur: "Taylor Swift", musique: "Taylor Swift - Shake It Off", uneReponse: false)
    
>>>>>>> 4b00afc8cf9fdf01ace9ce83a899c8f7efb5de0e
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initTimer()
        initBarTimer()
        
        var lesQuestions: [Question] = [q1, q2, q3, q4, q5, q6]
        
        //Si le nombre de questions jouées n'est pas supérieure au nombre de questions disponibles, le jeu passe à la questions suivantes
        if(cptQuestion < lesQuestions.count){
            initTitres(lesQuestions[cptQuestion])
            initChanteur(lesQuestions[cptQuestion])
            initQuestion()
        }
        //Si toutes les questions ont été jouées, le joueur est redirigé vers la page de score et la musique s'arrete
        else{
            player?.stop()
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let resultatViewController = storyboard.instantiateViewController(withIdentifier: "ResultatViewController") as! ResultatViewController
            resultatViewController.score = score
            resultatViewController.modalPresentationStyle = .fullScreen
            self.present(resultatViewController, animated: true) {
                self.hasToPop = true
            }
        }
        
<<<<<<< HEAD
        let musiques = ["Coldplay - A Sky Full Of Stars", "B.o.B ft. Hayley Williams - Airplanes", "Cats on Trees, Calogero - Jimmy", "Claudio Capeo -  Un homme debout", "Patrick Sébastien - Les sardines", "Taylor Swift - Shake It Off"]
        
        let lesQuestions: [Question] = [q1, q2]
        
        if(cpt < lesQuestions.count){
            initTitres(lesQuestions[cpt])
            initChanteur(lesQuestions[cpt])
        }
        
        if let player = player, player.isPlaying{
            player.stop()
        }
        else{
            let musique = musiques[cpt]
            let urlString = Bundle.main.path(forResource: musique, ofType: "mp3")
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
=======
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
            cptTimer = 0
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
    
    func initQuestion(){
        let lesQuestions: [Question] = [q1, q2, q3, q4, q5, q6]
        
        titleQuestion.text = "Question " + String(cptQuestion+1) + "/" + String(lesQuestions.count)
        
        let laQuestion = lesQuestions[cptQuestion]
        
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
>>>>>>> 4b00afc8cf9fdf01ace9ce83a899c8f7efb5de0e
            }
            
            player.play()
            
        }catch{
            print("Problems")
        }
    }
    
    //Affiche les propositions des titres et mets leur background en bleu
    func initTitres(_ newQuestion : Question){
        btnTitre1.setTitle(newQuestion.optionTitre[0], for: .normal)
        btnTitre2.setTitle(newQuestion.optionTitre[1], for: .normal)
        btnTitre3.setTitle(newQuestion.optionTitre[2], for: .normal)
        btnTitre4.setTitle(newQuestion.optionTitre[3], for: .normal)
        
        btnTitre1.backgroundColor = UIColor.blue
        btnTitre2.backgroundColor = UIColor.blue
        btnTitre3.backgroundColor = UIColor.blue
        btnTitre4.backgroundColor = UIColor.blue
        
        btnTitre1.isUserInteractionEnabled = true
        btnTitre2.isUserInteractionEnabled = true
        btnTitre3.isUserInteractionEnabled = true
        btnTitre4.isUserInteractionEnabled = true
    }
    
<<<<<<< HEAD
    @IBAction func didTapButton(){
        
        
    }
    
    func initTitres(_ newQuestion : Question){
        btnTitre1.setTitle(newQuestion.optionTitre[0], for: .normal)
        btnTitre2.setTitle(newQuestion.optionTitre[1], for: .normal)
        btnTitre3.setTitle(newQuestion.optionTitre[2], for: .normal)
        btnTitre4.setTitle(newQuestion.optionTitre[3], for: .normal)
    }
    
    func initChanteur(_ newQuestion: Question){
        btnChanteur1.setTitle(newQuestion.optionChanteur[0], for: .normal)
        btnChanteur2.setTitle(newQuestion.optionChanteur[1], for: .normal)
        btnChanteur3.setTitle(newQuestion.optionChanteur[2], for: .normal)
        btnChanteur4.setTitle(newQuestion.optionChanteur[3], for: .normal)
    }
    
    @IBAction func clicNext(){
        cpt = cpt + 1
        viewDidLoad()
    }
=======
    //Affiche les propositions des chanteurs et mets leur background en bleu
    func initChanteur(_ newQuestion: Question){
        btnChanteur1.setTitle(newQuestion.optionChanteur[0], for: .normal)
        btnChanteur2.setTitle(newQuestion.optionChanteur[1], for: .normal)
        btnChanteur3.setTitle(newQuestion.optionChanteur[2], for: .normal)
        btnChanteur4.setTitle(newQuestion.optionChanteur[3], for: .normal)
        
        btnChanteur1.backgroundColor = UIColor.blue
        btnChanteur2.backgroundColor = UIColor.blue
        btnChanteur3.backgroundColor = UIColor.blue
        btnChanteur4.backgroundColor = UIColor.blue
        
        btnChanteur1.isUserInteractionEnabled = true
        btnChanteur2.isUserInteractionEnabled = true
        btnChanteur3.isUserInteractionEnabled = true
        btnChanteur4.isUserInteractionEnabled = true
    }
    
    //Passer à la question suivante
    @IBAction func clicNext(){
        cptQuestion = cptQuestion + 1
        viewDidLoad()
    }
    
    //Verifie si la réponse choisie parmis les titres est correcte ou non
    @IBAction func selectReponseTitre( sender: UIButton){
        let lesQuestions: [Question] = [q1, q2, q3, q4, q5, q6]
        let laQuestion = lesQuestions[cptQuestion]
        //Si la réponse est correcte, le bouton devient vert et le score du joueur s'incrémente de 1
        if(laQuestion.correcteTitre == sender.titleLabel?.text){
            sender.backgroundColor = UIColor.green
            score += 1
        }
        //Si la réponse est fausse, le bouton devient rouge et le joueur ne marque aucun point
        else {
            sender.backgroundColor = UIColor.red
        }
        btnTitre1.isUserInteractionEnabled = false
        btnTitre2.isUserInteractionEnabled = false
        btnTitre3.isUserInteractionEnabled = false
        btnTitre4.isUserInteractionEnabled = false
        
    }
    
    //Verifie si la réponse choisie parmis les chanteurs est correcte ou non
    @IBAction func selectReponseChanteur( sender: UIButton){
        let lesQuestions: [Question] = [q1, q2, q3, q4, q5, q6]
        let laQuestion = lesQuestions[cptQuestion]
        //Si la réponse est correcte, le bouton devient vert et le score du joueur s'incrémente de 1
        if(laQuestion.correcteChanteur == sender.titleLabel?.text){
            sender.backgroundColor = UIColor.green
            score += 1
        }
        //Si la réponse est fausse, le bouton devient rouge et le joueur ne marque aucun point
        else {
            sender.backgroundColor = UIColor.red
        }
        btnChanteur1.isUserInteractionEnabled = false
        btnChanteur2.isUserInteractionEnabled = false
        btnChanteur3.isUserInteractionEnabled = false
        btnChanteur4.isUserInteractionEnabled = false
        
    }
>>>>>>> 4b00afc8cf9fdf01ace9ce83a899c8f7efb5de0e
}
