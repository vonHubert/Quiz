//
//  ViewController.swift
//  Quiz
//
//  Created by MacBook Air 13 on 12.11.2022.
//

import UIKit

class QuestionsViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet var questionProgressView: UIProgressView!
    @IBOutlet var questionTextLabel: UILabel!
    
    @IBOutlet var singleQuestionStackView: UIStackView!
    @IBOutlet v/Users/macbookair13/Desktop/SWIFTBOOK/Login App/HW_2/HW_2.06_SergeySokolov/Models/User.swiftar singleQuestionButtons: [UIButton]!
    
    @IBOutlet var multipleQuestionStackView: UIStackView!
    @IBOutlet var multipleQuestionLabels: [UILabel]!
    @IBOutlet var multipleQuestionSwitches: [UISwitch]!
    
    
    @IBOutlet var rangedQuestionStackView: UIStackView!
    @IBOutlet var rangedQuestionLabels: [UILabel]!
    @IBOutlet var rangedQuestionSlider: UISlider!
    
    // MARK: - Private Properties
    private let questions = Question.getQuestions()
    private var questionIndeх = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionTextLabel.text = "SET"
        updateUI()
        
    }
    
    // MARK: -IBActions
    @IBAction func singleAnswerButtonTapped(_ sender: UIButton) {
        print("singleAnswerButtonTapped")
    }
    
    @IBAction func multipleAnswerButtonTapped() {
        print("multipleAnswerButtonTapped")
    }
    
    @IBAction func rangedAnswerButtonTapped() {
        print("rangedAnswerButtonTapped")
        
    }
}

extension QuestionsViewController {
    
    private func updateUI() {
        // Hiding stacks
        for stackView in [singleQuestionStackView, multipleQuestionStackView, rangedQuestionStackView] {
            stackView?.isHidden = true
        }
        
        // Get current question
        let currentQuestion = questions[questionIndeх]
        
        // Set current quesion for question label
//      questionTextLabel.text = "SET"//currentQuestion.title

        // Calculete current progress
        let totalProgress = Float(questionIndeх) / Float(questions.count)
        
        // Set progressView
    questionProgressView.setProgress(totalProgress, animated: true)
        
        // Set navigation title
        title = "Вопрос № \(questionIndeх + 1) из \(questions.count)"
        
        
    }
    
    
    
    
}
