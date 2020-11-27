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
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func clicPlay(){
        for dcpt in 1...3 {
            print(dcpt)
            lblDecompte.text = String(dcpt)
        }
    }
}
