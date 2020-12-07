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
    
    var player: AVAudioPlayer?
    
    struct Question {
        let optionTitre : [String]
        let optionChanteur : [String]
        let correcteTitre : String
        let correcteChanteur : String
        let musique : String
        let uneReponse : Bool
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let q1 = Question(optionTitre: ["Oui", "ok", "A Sky Full Of Stars", "Salut"], optionChanteur: ["Joe", "Coldplay", "oui oui", "pompom"], correcteTitre: "A Sky Full Of Stars", correcteChanteur: "Coldplay", musique: "Coldplay - A Sky Full Of Stars", uneReponse: false)
        let q2 = Question(optionTitre: ["Non", "Airplanes", "jesaispas", "hey"], optionChanteur: ["Lala", "aaaaaa", "non non", "B.o.B ft. Hayley Williams"], correcteTitre: "Airplanes", correcteChanteur: "B.o.B ft. Hayley Williams", musique: "B.o.B ft. Hayley Williams - Airplanes", uneReponse: false)
        
    }
    
    @IBAction func didTapButton(){
        let musiques = ["Coldplay - A Sky Full Of Stars", "B.o.B ft. Hayley Williams - Airplanes", "Cats on Trees, Calogero - Jimmy", "Claudio Capeo -  Un homme debout", "Patrick Sébastien - Les sardines", "Taylor Swift - Shake It Off"]
        let cpt = 0
        if let player = player, player.isPlaying{
            btnPlay.setTitle("Play", for: .normal)
            player.stop()
        }
        else{
            btnPlay.setTitle("Stop", for: .normal)
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
    
    func initTitres(newQuestion : Question){
        
    }


}
