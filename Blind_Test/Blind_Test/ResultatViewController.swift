//
//  ResultatViewController.swift
//  Blind_Test
//
//  Created by William GLENAT on 09/12/2020.
//  Copyright © 2020 Hugo. All rights reserved.
//

import UIKit

class ResultatViewController: UIViewController {
    
    //Déclaration des variables
    @IBOutlet weak var leScore: UILabel!
    @IBOutlet weak var btnHome: UIButton!
    
    //Récupération du score de MusiqueQuestionViewController
    var score: Int!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Arrondi des angles des boutons
        btnHome.layer.cornerRadius = 10.0
        
        //Affiche le score du joueur
        leScore.text = "Votre score : " + String(score) + "/12"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Redirige vers la page d'accueil
    @IBAction func clicReturnAction(){
        self.dismiss(animated: true, completion: nil)
    }

}
