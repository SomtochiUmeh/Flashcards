//
//  ViewController.swift
//  Flashcards
//
//  Created by Somtochi Umeh on 2/27/22.
//

import UIKit

struct Flashcard {
    var question: String
    var answer: String
}

class ViewController: UIViewController {

    @IBOutlet weak var frontLabel: UILabel!
    @IBOutlet weak var backLabel: UILabel!
    
    @IBOutlet weak var card: UIView!
    
    @IBOutlet weak var btnOne: UIButton!
    @IBOutlet weak var btnTwo: UIButton!
    @IBOutlet weak var btnThree: UIButton!
    
    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    // array to hold multiple flashcards
    var flashcards = [Flashcard]()
    // current flashcard index
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // read saved flashcards
        readSavedFlashcards()
        
        // adding initial flashcard if needed
        if flashcards.count == 0 {
            updateFlashcard(question: "What's today's date", answer: "February 27th", extraAnswerOne: "February 26th", extraAnswerTwo: "February 28th", isExisting: true)
        } else {
            updateLabels()
            updateNextPrevButtons()
        }
        
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
    
    @IBAction func didTapOnPrev(_ sender: Any) {
        // decrease current index
        currentIndex = currentIndex - 1
        // update labels
        updateLabels()
        // update buttons
        updateNextPrevButtons()
        
        // hide answers
        if frontLabel.isHidden{
        frontLabel.isHidden = false
        }
    }
    
    @IBAction func didTapOnNext(_ sender: Any) {
        // increase current index
        currentIndex = currentIndex + 1
        // update labels
        updateLabels()
        // update buttons
        updateNextPrevButtons()
        
        // hide answers
        if frontLabel.isHidden{
        frontLabel.isHidden = false
        }
    }
    
    @IBAction func didTapOnDelete(_ sender: Any) {
        
        // show confirmation
        let alert = UIAlertController(title: "Delete flashcard", message: "Are you sure you want to delete it?", preferredStyle: .actionSheet)
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { action in
            self.deleteCurrentFlashcard()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        // add actions to the alert
        alert.addAction(deleteAction)
        alert.addAction(cancelAction)
        // present the alert
        present(alert, animated: true)
    }
    
    func deleteCurrentFlashcard(){
        // can delete only if you have more than one card
        if flashcards.count > 1 {
            // delete current
            flashcards.remove(at: currentIndex)
            // special case to check if last card was deleted
            if currentIndex > flashcards.count - 1 {
                currentIndex = flashcards.count - 1
            }
            // update buttons
            updateNextPrevButtons()
            // update labels
            updateLabels()
        // special case when there's one card left
        } else {
            let alert = UIAlertController(title: "Cannot delete flashcard", message: "You can't delete if you have only one card", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(okAction)
            present(alert, animated: true)
        }
        // save it
        saveAllFlashcardsToDisk()
    }
    
    func updateFlashcard(question: String, answer: String, extraAnswerOne: String, extraAnswerTwo: String, isExisting: Bool) {
        let flashcard = Flashcard(question: question, answer: answer)
        
        // set multiple choice button titles
        btnOne.setTitle(extraAnswerOne, for: .normal)
        btnTwo.setTitle(answer, for: .normal)
        btnThree.setTitle(extraAnswerTwo, for: .normal)
        
        // if editing, replace card at current index
        if isExisting {
            flashcards[currentIndex] = flashcard
        } else {
            // add flashcard to flashcards array
            flashcards.append(flashcard)
            
            // logging to the console
            print("🥸 Added new flashcard")
            print("🥸 We now have \(flashcards.count) flashcards")
            
            // update current index
            currentIndex = flashcards.count - 1
            print("🥸 Our current index is \(currentIndex)")
        }
        // update buttons
        updateNextPrevButtons()
        // update labels
        updateLabels()
        
        // save flashcards
        saveAllFlashcardsToDisk()
    }
    
    func updateNextPrevButtons() {
        // disable next button if at the end
        if currentIndex == flashcards.count - 1 {
            nextButton.isEnabled = false
        } else {
            nextButton.isEnabled = true
        }
        // disable prev button if at the start
        if currentIndex == 0 {
            prevButton.isEnabled = false
        } else {
            prevButton.isEnabled = true
        }
    }
    
    func updateLabels() {
        // get current flashcard
        let currentFlashcard = flashcards[currentIndex]
        // update labels
        frontLabel.text = currentFlashcard.question
        backLabel.text = currentFlashcard.answer
    }
    
    func saveAllFlashcardsToDisk() {
        // from flashcard array to dictionary array
        let dictionaryArray = flashcards.map { (card) -> [String: String] in
            return ["question": card.question, "answer": card.answer]
        }
        // save array on disk using UserDefaults
        UserDefaults.standard.set(dictionaryArray, forKey: "flashcards")
        // log to console
        print("🎊 Flashcards saved to UserDefaults")
    }
    
    func readSavedFlashcards() {
        // read dictionary from disk if any
        if let dictionaryArray = UserDefaults.standard.array(forKey: "flashcards") as? [[String: String]] {
            
            let savedCards = dictionaryArray.map { dictionary -> Flashcard in
                return Flashcard(question: dictionary["question"]!, answer: dictionary["answer"]!)
            }
            
            // put all these cards in our flashcaards array
            flashcards.append(contentsOf: savedCards)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // destination of segue is Navigation Controller
        let navigationController = segue.destination as! UINavigationController
        
        // Navigation controller only contains a Creation View Controller
        let creationController = navigationController.topViewController as! CreationViewController
        
        // set flashcardsController property to self
        creationController.flashcardsController = self
        
        // move info from viewController to creationController if editing
        if segue.identifier == "EditSegue" {
            creationController.initialQuestion = frontLabel.text
            creationController.initialAnswer = backLabel.text
            creationController.initialOptOne = btnOne.currentTitle
            creationController.initialOptTwo = btnThree.currentTitle
        }
    }
    
}

