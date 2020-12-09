//
//  MusiqueViewController.swift
//  Blind-Test
//
//  Created by yann on 27/11/2020.
//  Copyright © 2020 Hugo. All rights reserved.
//

import UIKit

class MusiqueViewController: UIViewController {
    
    //Déclaration des variables
    @IBOutlet weak var lblTitleMusic: UILabel!
    @IBOutlet weak var lblPretMusic: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var btnPlayMusic: UIButton!;
    @IBOutlet weak var lblDecompte: UILabel!
    var timer = Timer()
    var cpt = 4
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func clicPlay(){
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.compteur), userInfo: nil, repeats: true)
    }
    
    @objc func compteur(){
        
        if(cpt == 1){
            lblDecompte.text = "Partez !"
            timer.invalidate()
            demarrerQuizz()
        } else {
            cpt = cpt - 1
            lblDecompte.text = String(cpt)
        }
        
    }
    
    func demarrerQuizz(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let musicQuestionViewController = storyboard.instantiateViewController(withIdentifier: "MusiqueQuestionViewController") as! MusiqueQuestionViewController
        self.navigationController?.pushViewController(musicQuestionViewController, animated: true)
    }
}
