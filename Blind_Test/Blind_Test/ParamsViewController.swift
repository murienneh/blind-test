//
//  ParamsViewController.swift
//  Blind-Test
//
//  Created by Hugo on 27/11/2020.
//  Copyright © 2020 Hugo. All rights reserved.
//

import UIKit

class ParamsViewController: UIViewController {
    
    //Initialisation des variables
    @IBOutlet weak var monSlider: UISlider!
    @IBOutlet weak var valeur: UILabel!
    @IBOutlet weak var btnRetour: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        //Mise en forme du bouton
        btnRetour.layer.cornerRadius = 10.0
        let value = monSlider.value
        //Affichage de la valeur sur le slide bar
        valeur.text = String(value) + " secondes"
    }
    
    // Permet de récupérer la valeur de la slide bar
    @IBAction func setValue(){
        let step : Float = 15
        let sliderValue = monSlider.value
        let roundedValue = round(sliderValue / step) * step
        valeur.text = String(roundedValue) + " secondes"
    }
    
    //Lorsqu'on click sur le bouton on retourne sur la page d'accueil
    @IBAction func clicReturnAction(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        self.navigationController?.popViewController(animated: true)
    }

}
