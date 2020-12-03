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

    override func viewDidLoad() {
        super.viewDidLoad()
        let value = monSlider.value
        valeur.text = String(value) + " secondes"
    }
    
    @IBAction func setValue(){
        let step : Float = 15
        let sliderValue = monSlider.value
        let roundedValue = round(sliderValue / step) * step
        valeur.text = String(roundedValue) + " secondes"
    }

}
