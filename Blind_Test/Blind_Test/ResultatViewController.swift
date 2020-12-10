//
//  ResultatViewController.swift
//  Blind_Test
//
//  Created by William GLENAT on 09/12/2020.
//  Copyright © 2020 Hugo. All rights reserved.
//

import UIKit

class ResultatViewController: UIViewController {
    
    @IBOutlet weak var leScore: UILabel!
    @IBOutlet weak var btnHome: UIButton!
    var score: Int!

    override func viewDidLoad() {
        super.viewDidLoad()

        leScore.text = "Votre score : " + String(score) + "/12"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clicReturnAction(){
        self.dismiss(animated: true, completion: nil)
    }

}
