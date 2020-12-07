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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapButton(){
        if let player = player, player.isPlaying{
            btnPlay.setTitle("Play", for: .normal)
            player.stop()
        }
        else{
            btnPlay.setTitle("Stop", for: .normal)
            let urlString = Bundle.main.path(forResource: "Coldplay - A Sky Full Of Stars", ofType: "mp3")
            do {
                try AVAudioSession.sharedInstance().setMode(.default)
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


}
