//
//  ViewController.swift
//  blindTest
//
//  Created by yann on 25/11/2020.
//

import UIKit

class ViewController: UIViewController {
    
    //Déclaration des objets
    @IBOutlet weak var titrelbl: UILabel!
    @IBOutlet weak var musicbtn: UIButton!
    @IBOutlet weak var pubbtn: UIButton!
    @IBOutlet weak var generiquebtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Style du boutton
        musicbtn.layer.cornerRadius = 5.0
        pubbtn.layer.cornerRadius = 5.0
        generiquebtn.layer.cornerRadius = 5.0
    }


}

