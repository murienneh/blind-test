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
    
    @IBOutlet weak var btnPlay: UIButton!
    @IBOutlet weak var btnTitre1: UIButton!
    @IBOutlet weak var btnTitre2: UIButton!
    @IBOutlet weak var btnTitre3: UIButton!
    @IBOutlet weak var btnTitre4: UIButton!
    @IBOutlet weak var btnChanteur1: UIButton!
    @IBOutlet weak var btnChanteur2: UIButton!
    @IBOutlet weak var btnChanteur3: UIButton!
    @IBOutlet weak var btnChanteur4: UIButton!
    @IBOutlet weak var btnNext: UIButton!
    
    var player: AVAudioPlayer?
    
    struct Question {
        let optionTitre : [String]
        let optionChanteur : [String]
        let correcteTitre : String
        let correcteChanteur : String
        let musique : String
        let uneReponse : Bool
    }
    
    let q1 = Question(optionTitre: ["Oui", "ok", "A Sky Full Of Stars", "Salut"], optionChanteur: ["Joe", "Coldplay", "oui oui", "pompom"], correcteTitre: "A Sky Full Of Stars", correcteChanteur: "Coldplay", musique: "Coldplay - A Sky Full Of Stars", uneReponse: false)
    let q2 = Question(optionTitre: ["Non", "Airplanes", "jesaispas", "hey"], optionChanteur: ["Lala", "aaaaaa", "non non", "B.o.B ft. Hayley Williams"], correcteTitre: "Airplanes", correcteChanteur: "B.o.B ft. Hayley Williams", musique: "B.o.B ft. Hayley Williams - Airplanes", uneReponse: false)
    
    var cpt = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
            }
        }
        
    }
    
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
}
