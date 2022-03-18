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
    
    @IBOutlet weak var extraAnswerOne: UITextField!
    @IBOutlet weak var extraAnswerTwo: UITextField!
    
    var initialQuestion: String?
    var initialAnswer: String?
    var initialOptOne: String?
    var initialOptTwo: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        questionTextField.text = initialQuestion
        answerTextField.text = initialAnswer
        extraAnswerOne.text = initialOptOne
        extraAnswerTwo.text = initialOptTwo
    }
    
    @IBAction func didTapOnCancel(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func didTapOnDone(_ sender: Any) {
        // Get the question and answer fields' texts
        let questionText = questionTextField.text
        let answerText = answerTextField.text
        let optOne = extraAnswerOne.text
        let optTwo = extraAnswerTwo.text
        
        // Check if empty
        if questionText == nil || answerText == nil || questionText!.isEmpty || answerText!.isEmpty {
            
            // show error
            let alert = UIAlertController(title: "Missing text", message: "You need to enter both a question and an answer", preferredStyle: .alert)
            present(alert, animated: true)
            let okAction = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(okAction)
            
        } else {
            
            // Call function to update flashcard
            flashcardsController.updateFlashcard(question: questionText!, answer: answerText!, extraAnswerOne: optOne, extraAnswerTwo: optTwo)
            // Dismiss
            dismiss(animated: true)
            
        }
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
