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
    
    var score = 0
    
    var player: AVAudioPlayer?
    
    struct Question {
        let optionTitre : [String]
        let optionChanteur : [String]
        let correcteTitre : String
        let correcteChanteur : String
        let musique : String
        let uneReponse : Bool
    }
    
    let q1 = Question(optionTitre: ["Paradise", "Counting Stars", "A Sky Full Of Stars", "Vertigo"], optionChanteur: ["Maroon 5", "Coldplay", "U2", "OneRepublic"], correcteTitre: "A Sky Full Of Stars", correcteChanteur: "Coldplay", musique: "Coldplay - A Sky Full Of Stars", uneReponse: false)
    
    let q2 = Question(optionTitre: ["Airplanes", "Wolves", "Price Tag", "Only Girl"], optionChanteur: ["Rihanna", "Jessie J ft. B.o.B", "Selena Gomez", "B.o.B ft. Hayley Williams"], correcteTitre: "Airplanes", correcteChanteur: "B.o.B ft. Hayley Williams", musique: "B.o.B ft. Hayley Williams - Airplanes", uneReponse: false)
    
    let q3 = Question(optionTitre: ["Sirens Call", "Jimmy", "Jammy", "On My Own"], optionChanteur: ["Cats on Trees, Calogero", "Marina Kaye", "Louane", "Adele"], correcteTitre: "Jimmy", correcteChanteur: "Cats on Trees, Calogero", musique: "Cats on Trees, Calogero - Jimmy", uneReponse: false)
    
    let q4 = Question(optionTitre: ["Un homme debout", "Allez Reste", "Debout", "Dis-Le Moi"], optionChanteur: ["Renan Luce", "Grégoire", "Claudio Capeo", "Boulevard des Airs"], correcteTitre: "Un homme debout", correcteChanteur: "Claudio Capeo", musique: "Claudio Capeo -  Un homme debout", uneReponse: false)
    
    let q5 = Question(optionTitre: ["Tourner Les Serviettes", "Les Sardines", "Le Petit Bonhomme En Mousse", "On est serrés"], optionChanteur: ["Joe l'Éclate", "Sébastien Patoche", "Michaël Youn", "Patrick Sébastien"], correcteTitre: "Les Sardines", correcteChanteur: "Patrick Sébastien", musique: "Patrick Sébastien - Les sardines", uneReponse: false)
    
    let q6 = Question(optionTitre: ["Blank Space", "So What", "Shake It Off", "The Middle"], optionChanteur: ["Zedd, Maren Morris, Grey", "Taylor Swift", "Pink", "Zara Larsson"], correcteTitre: "Shake It Off", correcteChanteur: "Taylor Swift", musique: "Taylor Swift - Shake It Off", uneReponse: false)
    
    
    var cpt = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let lesQuestions: [Question] = [q1, q2, q3, q4, q5, q6]
        
        if(cpt < lesQuestions.count){
            initTitres(lesQuestions[cpt])
            initChanteur(lesQuestions[cpt])
            initQuestion()
        }
        else{
            player?.stop()
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let resultatViewController = storyboard.instantiateViewController(withIdentifier: "ResultatViewController") as! ResultatViewController
            resultatViewController.score = score
            self.navigationController?.pushViewController(resultatViewController, animated: true)
        }
        
    }
    
    func initQuestion(){
        let lesQuestions: [Question] = [q1, q2, q3, q4, q5, q6]
        
        titleQuestion.text = "Question " + String(cpt+1) + "/" + String(lesQuestions.count)
        
        let laQuestion = lesQuestions[cpt]
        
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
    
    @IBAction func clicNext(){
        cpt = cpt + 1
        viewDidLoad()
    }
    
    @IBAction func selectReponseTitre( sender: UIButton){
        let lesQuestions: [Question] = [q1, q2, q3, q4, q5, q6]
        let laQuestion = lesQuestions[cpt]
        if(laQuestion.correcteTitre == sender.titleLabel?.text){
            sender.backgroundColor = UIColor.green
            score += 1
        }
        else {
            sender.backgroundColor = UIColor.red
        }
        btnTitre1.isUserInteractionEnabled = false
        btnTitre2.isUserInteractionEnabled = false
        btnTitre3.isUserInteractionEnabled = false
        btnTitre4.isUserInteractionEnabled = false
        
    }
    
    @IBAction func selectReponseChanteur( sender: UIButton){
        let lesQuestions: [Question] = [q1, q2, q3, q4, q5, q6]
        let laQuestion = lesQuestions[cpt]
        if(laQuestion.correcteChanteur == sender.titleLabel?.text){
            sender.backgroundColor = UIColor.green
            score += 1
        }
        else {
            sender.backgroundColor = UIColor.red
        }
        btnChanteur1.isUserInteractionEnabled = false
        btnChanteur2.isUserInteractionEnabled = false
        btnChanteur3.isUserInteractionEnabled = false
        btnChanteur4.isUserInteractionEnabled = false
        
    }
}
