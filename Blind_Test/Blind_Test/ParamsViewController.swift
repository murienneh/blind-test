//
//  ParamsViewController.swift
//  Blind-Test
//
//  Created by Hugo on 27/11/2020.
//  Copyright © 2020 Hugo. All rights reserved.
//

import UIKit

class ParamsViewController: UIViewController {
    
    @IBOutlet weak var monSlider: UISlider!
    @IBOutlet weak var valeur: UILabel!
    @IBOutlet weak var btnRetour: UIButton!

    var hasToPop = false
    var tempsRep: Float = 45
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnRetour.layer.cornerRadius = 10.0
        let value = monSlider.value
        valeur.text = String(value) + " secondes"
    }
    
    @IBAction func setValue(){
        let step : Float = 15
        let sliderValue = monSlider.value
        tempsRep = round(sliderValue / step) * step
        valeur.text = String(tempsRep) + " secondes"
    }
    
    @IBAction func clicReturnAction(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        viewController.tempsRep = tempsRep
        self.navigationController?.pushViewController(viewController, animated: true)
        
    }

}
