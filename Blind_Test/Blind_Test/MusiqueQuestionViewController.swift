//
//  MusiqueQuestionViewController.swift
//  Blind-Test
//
//  Created by yann on 02/12/2020.
//  Copyright © 2020 Hugo. All rights reserved.
//

import AVFoundation
import UIKit

class MusiqueQuestionViewController: UIViewController {
	
	@IBOutlet weak var titleQuestion: UILabel!
	@IBOutlet weak var btnTitre1: UIButton!
	@IBOutlet weak var btnTitre2: UIButton!
	@IBOutlet weak var btnTitre3: UIButton!
	@IBOutlet weak var btnTitre4: UIButton!
	@IBOutlet weak var btnChanteur1: UIButton!
	@IBOutlet weak var btnChanteur2: UIButton!
	@IBOutlet weak var btnChanteur3: UIButton!
	@IBOutlet weak var btnChanteur4: UIButton!
	@IBOutlet weak var btnNext: UIButton!
	
	var player: AVAudioPlayer?
	
	var score = 0
	
	struct Question {
		let optionTitre : [String]
		let optionChanteur : [String]
		let correcteTitre : String
		let correcteChanteur : String
		let musique : String
		let uneReponse : Bool
	}
	
	let q1 = Question(optionTitre: ["Oui", "ok", "A Sky Full Of Stars", "Salut"], optionChanteur: ["Joe", "Coldplay", "oui oui", "pompom"], correcteTitre: "A Sky Full Of Stars", correcteChanteur: "Coldplay", musique: "Coldplay - A Sky Full Of Stars", uneReponse: false)
	let q2 = Question(optionTitre: ["Non", "Airplanes", "jesaispas", "hey"], optionChanteur: ["Lala", "aaaaaa", "non non", "B.o.B ft. Hayley Williams"], correcteTitre: "Airplanes", correcteChanteur: "B.o.B ft. Hayley Williams", musique: "B.o.B ft. Hayley Williams - Airplanes", uneReponse: false)
	
	var cpt = 0
	
	var hasToPop = false
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let lesQuestions: [Question] = [q1, q2]
		
		titleQuestion.text = "Question " + String(cpt+1) + "/" + String(lesQuestions.count)
		
		if(cpt < lesQuestions.count){
			initTitres(lesQuestions[cpt])
			initChanteur(lesQuestions[cpt])
			
			let laQuestion = lesQuestions[cpt]
			
			let urlString = Bundle.main.path(forResource: laQuestion.musique, ofType: "mp3")
			do {
				try AVAudioSession.sharedInstance().setMode("AVAudioSessionModeDefault")
				try AVAudioSession.sharedInstance().setActive(true, with: .notifyOthersOnDeactivation)
				
				guard let urlString = urlString else {
					return
				}
				
				player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: urlString))
				
				guard let player = player else {
					return
				}
				
				player.play()
				
			}catch{
				print("Problems")
			}
			
		} else {
			
			player?.stop()
			
			let storyboard = UIStoryboard(name: "Main", bundle: nil)
			let resultatViewController = storyboard.instantiateViewController(withIdentifier: "ResultatViewController") as! ResultatViewController
			resultatViewController.score = score
			resultatViewController.modalPresentationStyle = .fullScreen
			self.present(resultatViewController, animated: true) {
				self.hasToPop = true
			}
		}
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(true)
		
		if hasToPop {
			self.navigationController?.popToRootViewController(animated: false)
		}
	}
	
	func initTitres(_ newQuestion : Question){
		btnTitre1.setTitle(newQuestion.optionTitre[0], for: .normal)
		btnTitre2.setTitle(newQuestion.optionTitre[1], for: .normal)
		btnTitre3.setTitle(newQuestion.optionTitre[2], for: .normal)
		btnTitre4.setTitle(newQuestion.optionTitre[3], for: .normal)
		
		btnTitre1.backgroundColor = UIColor.blue
		btnTitre2.backgroundColor = UIColor.blue
		btnTitre3.backgroundColor = UIColor.blue
		btnTitre4.backgroundColor = UIColor.blue
		
		btnTitre1.isUserInteractionEnabled = true
		btnTitre2.isUserInteractionEnabled = true
		btnTitre3.isUserInteractionEnabled = true
		btnTitre4.isUserInteractionEnabled = true
	}
	
	func initChanteur(_ newQuestion: Question){
		btnChanteur1.setTitle(newQuestion.optionChanteur[0], for: .normal)
		btnChanteur2.setTitle(newQuestion.optionChanteur[1], for: .normal)
		btnChanteur3.setTitle(newQuestion.optionChanteur[2], for: .normal)
		btnChanteur4.setTitle(newQuestion.optionChanteur[3], for: .normal)
		
		btnChanteur1.backgroundColor = UIColor.blue
		btnChanteur2.backgroundColor = UIColor.blue
		btnChanteur3.backgroundColor = UIColor.blue
		btnChanteur4.backgroundColor = UIColor.blue
		
		btnChanteur1.isUserInteractionEnabled = true
		btnChanteur2.isUserInteractionEnabled = true
		btnChanteur3.isUserInteractionEnabled = true
		btnChanteur4.isUserInteractionEnabled = true
	}
	
	@IBAction func clicNext(){
		cpt = cpt + 1
		viewDidLoad()
	}
	
	@IBAction func selectReponseTitre(_ sender: UIButton){
		let lesQuestions: [Question] = [q1, q2]
		let laQuestion = lesQuestions[cpt]
		if(laQuestion.correcteTitre == sender.titleLabel?.text){
			sender.backgroundColor = UIColor.green
			score += 1
		}
		else {
			sender.backgroundColor = UIColor.red
		}
		btnTitre1.isUserInteractionEnabled = false
		btnTitre2.isUserInteractionEnabled = false
		btnTitre3.isUserInteractionEnabled = false
		btnTitre4.isUserInteractionEnabled = false
		
	}
	
	@IBAction func selectReponseChanteur(_ sender: UIButton){
		let lesQuestions: [Question] = [q1, q2]
		let laQuestion = lesQuestions[cpt]
		if(laQuestion.correcteChanteur == sender.titleLabel?.text){
			sender.backgroundColor = UIColor.green
			score += 1
		}
		else {
			sender.backgroundColor = UIColor.red
		}
		btnChanteur1.isUserInteractionEnabled = false
		btnChanteur2.isUserInteractionEnabled = false
		btnChanteur3.isUserInteractionEnabled = false
		btnChanteur4.isUserInteractionEnabled = false
		
	}
}

