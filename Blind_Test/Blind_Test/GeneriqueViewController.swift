//
//  GeneriqueViewController.swift
//  Blind_Test
//
//  Created by William GLENAT on 11/12/2020.
//  Copyright © 2020 Hugo. All rights reserved.
//

import UIKit

class GeneriqueViewController: UIViewController {
    
    //Déclaration des variables
    @IBOutlet weak var lblTitleMusic: UILabel!
    @IBOutlet weak var lblPretMusic: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var btnPlayMusic: UIButton!;
    @IBOutlet weak var lblDecompte: UILabel!
    var tempsRep: Float!
    
    //Création d'un timer
    var timer = Timer()
    
    //Compteur pour le timer
    var cpt = 4
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Si l'utilisateur ne choisi pas la valeur du temps de réponse alors il est par défaut de 45 secondes
        if (tempsRep == nil){
            tempsRep = 45.0
        }
        
    }
    
    //Au clic, le compteur de lancement démarre
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
    
    //Une fois le décompte terminé on lance la partie, envoi sur la page MusiqueQuestionViewController
    func demarrerQuizz(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let generiqueQuestionViewController = storyboard.instantiateViewController(withIdentifier: "GeneriqueQuestionViewController") as! GeneriqueQuestionViewController
        generiqueQuestionViewController.tempsRep = tempsRep
        self.navigationController?.pushViewController(generiqueQuestionViewController, animated: true)
    }

}
