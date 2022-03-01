//
//  ViewController.swift
//  Flashcards
//
//  Created by Somtochi Umeh on 2/27/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var frontLabel: UILabel!
    @IBOutlet weak var backLabel: UILabel!
    @IBOutlet weak var card: UIView!
    @IBOutlet weak var btnOne: UIButton!
    @IBOutlet weak var btnTwo: UIButton!
    @IBOutlet weak var btnThree: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // rounded corners
        frontLabel.layer.cornerRadius = 25
        backLabel.layer.cornerRadius = 25.0
        card.layer.cornerRadius = 25
        
        // shadow
        card.layer.shadowRadius = 20.0
        card.layer.shadowOpacity = 0.6
        
        // clip
        frontLabel.clipsToBounds = true
        backLabel.clipsToBounds = true
        
        // rounded button corner
        btnOne.layer.cornerRadius = 25
        btnOne.clipsToBounds = true
        btnTwo.layer.cornerRadius = 25
        btnTwo.clipsToBounds = true
        btnThree.layer.cornerRadius = 25
        btnThree.clipsToBounds = true
        
        // button width
        btnOne.layer.borderWidth = 3.0
        btnTwo.layer.borderWidth = 3.0
        btnThree.layer.borderWidth = 3.0
        
        // button width color
        btnOne.layer.borderColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
        btnTwo.layer.borderColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
        btnThree.layer.borderColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
    }

    @IBAction func didTapOnFlashcard(_ sender: Any) {
        if frontLabel.isHidden{
        frontLabel.isHidden = false
        } else {
            frontLabel.isHidden = true
        }
    }
    
    @IBAction func tapOptn1(_ sender: Any) {
        btnOne.isHidden = true
    }
    @IBAction func tapOptn2(_ sender: Any) {
        frontLabel.isHidden = true
    }
    @IBAction func tapOptn3(_ sender: Any) {
        btnThree.isHidden = true
    }
}

