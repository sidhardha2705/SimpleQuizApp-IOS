//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    
    let allQuestions = QuestionBank()
    var pickedAnswer : Bool = false
    var currentQuestion : Int = 0
    var score : Int = 0
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstQuestion = allQuestions.list[currentQuestion].questionLabel
        questionLabel.text = firstQuestion
        
        scoreLabel.text = "\(score)"
        updateUI()
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1 {
            pickedAnswer = true
        }else if sender.tag == 2{
            pickedAnswer = false
        }
        
        checkAnswer()
        
    }
    
    
    func updateUI() {
        progressLabel.text = "\(currentQuestion + 1) / 13"
        progressBar.frame.size.width = (view.frame.size.width / 13 ) * CGFloat(currentQuestion + 1)
        
    }
    

    func nextQuestion() {
        
        if(currentQuestion <= 11){
            currentQuestion = currentQuestion + 1
            questionLabel.text = allQuestions.list[currentQuestion].questionLabel
            scoreLabel.text = "\(score)"
            updateUI()
        }
        else {
            let alertController = UIAlertController(title: "Done!", message: "You did it! You wanna start over again?", preferredStyle: .alert)
            
            let alertAction = UIAlertAction(title: "Restart", style: .default, handler: {
                (UIAlertAction) in
                self.startOver()
            })
            
            alertController.addAction(alertAction)
            
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    
    func checkAnswer() {
        let correctAnswer = allQuestions.list[currentQuestion].answer
        
        if correctAnswer == pickedAnswer {
            
            score = score + 1
            ProgressHUD.showSuccess("Correct!")
        }else {
            ProgressHUD.showError("Wrong :(")
        }
        nextQuestion()
        
    }
    
    
    func startOver() {
        score = 0
        currentQuestion = -1
        nextQuestion()
        
    }
    

    
}
