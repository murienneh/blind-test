//
//  GeneriqueQuestionViewController.swift
//  Blind_Test
//
//  Created by William GLENAT on 11/12/2020.
//  Copyright © 2020 Hugo. All rights reserved.
//

import AVFoundation
import UIKit

class GeneriqueQuestionViewController: UIViewController {
    
    //Déclaration des variables
    @IBOutlet weak var titleQuestion: UILabel!
    @IBOutlet weak var btnTitre1: UIButton!
    @IBOutlet weak var btnTitre2: UIButton!
    @IBOutlet weak var btnTitre3: UIButton!
    @IBOutlet weak var btnTitre4: UIButton!
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
        static func ==(lhs: GeneriqueQuestionViewController.Question, rhs: GeneriqueQuestionViewController.Question) -> Bool {
            return lhs.generique == rhs.generique
        }
        
        let optionTitre : [String]
        let correcteTitre : String
        let generique : String
        let uneReponse : Bool
    }

    //Création des questions
    let q1 = Question(optionTitre: ["Animals", "Pokemon", "Poket-Mon", "Digimon"], correcteTitre: "Pokemon", generique: "Pokemon", uneReponse: false)
    
    let q2 = Question(optionTitre: ["Star Wars", "Jurassic Park", "Seul sur Mars", "Alien"], correcteTitre: "Star Wars", generique: "Star Wars", uneReponse: false)
    
    let q3 = Question(optionTitre: ["Rose et Jack", "Poséidon", "Titanic", "La terrible Croisière"], correcteTitre: "Titanic", generique: "Titanic", uneReponse: false)
    
    let q4 = Question(optionTitre: ["Pirates de l'informatique", "Pirates des Caraïbes", "Matelot des Mers", "Inception"], correcteTitre: "Pirates des Caraïbes", generique: "Pirates des Caraïbes", uneReponse: false)
    
    let q5 = Question(optionTitre: ["Mission Difficile", "Agent Secret", "Mission Impossible", "Super Espion"], correcteTitre: "Mission Impossible", generique: "Mission Impossible", uneReponse: false)
    
    let q6 = Question(optionTitre: ["La vie de Sorcier", "Sabrina", "Magic", "Harry Potter"], correcteTitre: "Harry Potter", generique: "Harry Potter", uneReponse: false)

    //Création du tableau contenant les questions dans l'ordre aléatoire
    var lesQuestionsRandom: [Question] = []
    
    //Variable permettant de vérifier que nous somme au début du quizz pour ne pas instancier le tableau de l'ordre aléatoire à chaque question
    var initRandomQuestion: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
