//
//  CreationViewController.swift
//  Flashcards
//
//  Created by Somtochi Umeh on 3/18/22.
//

import UIKit

class CreationViewController: UIViewController {
    
    var flashcardsController: ViewController!
    
    @IBOutlet weak var questionTextField: UITextField!
    @IBOutlet weak var answerTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapOnCancel(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func didTapOnDone(_ sender: Any) {
        // Get the question and answer fields' texts
        let questionText = questionTextField.text
        let answerText = answerTextField.text
        
        // Call function to update flashcard
        flashcardsController.updateFlashcard(question: questionText!, answer: answerText!)
        
        // Dismiss
        dismiss(animated: true)
      }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
