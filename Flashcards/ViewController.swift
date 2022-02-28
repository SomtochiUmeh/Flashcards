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
    }

    @IBAction func didTapOnFlashcard(_ sender: Any) {
        if frontLabel.isHidden{
        frontLabel.isHidden = false
        } else {
            frontLabel.isHidden = true
        }
    }
    
}

