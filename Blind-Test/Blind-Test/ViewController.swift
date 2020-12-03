//
//  ViewController.swift
//  Blind-Test
//
//  Created by Hugo on 26/11/2020.
//  Copyright © 2020 Hugo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Déclaration des variables
    @IBOutlet weak var titlelbl: UILabel!
    @IBOutlet weak var btnMusic: UIButton!
    @IBOutlet weak var btnGenerique: UIButton!
    @IBOutlet weak var btnPublicite: UIButton!
    @IBOutlet weak var btnParams: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Arrondi des angles des boutons
        btnMusic.layer.cornerRadius = 10.0
        btnGenerique.layer.cornerRadius = 10.0
        btnPublicite.layer.cornerRadius = 10.0
    }
    
    //Lors d'un clic sur le bouton "Musique" va sur la page musique
    @IBAction func clicMusiqueAction(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let musicViewController = storyboard.instantiateViewController(withIdentifier: "MusiqueViewController") as! MusiqueViewController
        self.navigationController?.pushViewController(musicViewController, animated: true)
    }
    
    //Lors d'un clic sur le bouton engrenage, envoyer sur la page des paramètres
    @IBAction func clicParamsAction(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let paramsViewController = storyboard.instantiateViewController(withIdentifier: "ParamsViewController") as! ParamsViewController
        self.navigationController?.pushViewController(paramsViewController, animated: true)
    }


}

