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
    @IBOutlet var singleQuestionButtons: [UIButton]!
    
    @IBOutlet var multipleQuestionStackView: UIStackView!
    @IBOutlet var multipleQuestionLabels: [UILabel]!
    @IBOutlet var multipleQuestionSwitches: [UISwitch]!
    
    @IBOutlet var rangedQuestionStackView: UIStackView!
    @IBOutlet var rangedQuestionLabels: [UILabel]!
    @IBOutlet var rangedQuestionSlider: UISlider! {
        didSet {
            let answerCount = Float(currentAnswers.count - 1)
            rangedQuestionSlider.maximumValue = answerCount
            rangedQuestionSlider.value = answerCount / 2
        }
    }
    
    // MARK: - Private Properties
    private let questions = Question.getQuestions()
    private var questionIndeŃ… = 0
    private var chosenAnswers: [Answer] = []
    private var currentAnswers: [Answer] { questions[questionIndeŃ…].answers }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionTextLabel.text = "SET"
        updateUI()
        
    }
    
    // MARK: - IBActions
    @IBAction func singleAnswerButtonTapped(_ sender: UIButton) {
        guard let buttonIndex = singleQuestionButtons.firstIndex(of: sender) else { return }
        let currentAnswer = currentAnswers[buttonIndex]
        chosenAnswers.append(currentAnswer)
        goToNextQuestion()
       // print(currentAnswer)
    }
    
    @IBAction func multipleAnswerButtonTapped() {
        for (multipleSwitch, currentAnswer) in zip(multipleQuestionSwitches, currentAnswers) {
            if multipleSwitch.isOn {
                chosenAnswers.append(currentAnswer)
            }
        }
        
        goToNextQuestion()
    }
    
    @IBAction func rangedAnswerButtonTapped() {
        let index = lrintf(rangedQuestionSlider.value)
        print("INDEX:\(index)")
        chosenAnswers.append(currentAnswers[index])
        
        goToNextQuestion()
    }
}

// MARK: - Navigation
extension QuestionsViewController {
    private func goToNextQuestion() {
        questionIndeŃ… += 1
        if questionIndeŃ… < questions.count {
            updateUI()
            return
        } else {
            performSegue(withIdentifier: "showResult", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let finalAnswersVC = segue.destination as? ResultsViewController else { return }
        finalAnswersVC.chosenAnswers = chosenAnswers
    }
}




// MARK: - Private methods
extension QuestionsViewController {
    
    private func updateUI() {
        // Hiding stacks
        for stackView in [singleQuestionStackView, multipleQuestionStackView, rangedQuestionStackView] {
            stackView?.isHidden = true
        }
        
        // Get current question
        let currentQuestion = questions[questionIndeŃ…]
        
        // Set current quesion for question label
        questionTextLabel.text = currentQuestion.title
        
        // Calculete current progress
        let totalProgress = Float(questionIndeŃ…) / Float(questions.count)
        
        // Set progressView
        questionProgressView.setProgress(totalProgress, animated: true)
        
        // Set navigation title
        title = "Đ’ĐľĐżŃ€ĐľŃ? â„– \(questionIndeŃ… + 1) Đ¸Đ· \(questions.count)"
        
        // Show current question
        showCurrentAnswersStack(for: currentQuestion.responceType)
        
    }
    
    
    // Display current question stack method
    private func showCurrentAnswersStack(for type: ResponseType) {
        switch type {
        case .single: showSingleStack(with: currentAnswers)
        case .multiple: showMultipleStack(with: currentAnswers)
        case .ranged: showRangedStack(with: currentAnswers)
        }
    }
    
    private func showSingleStack(with answers: [Answer]) {
        singleQuestionStackView.isHidden = false
        
        for (button, answer) in zip(singleQuestionButtons, answers) {
            button.setTitle(answer.title, for: .normal)
        }
    }
    
    private func showMultipleStack(with answers: [Answer]) {
        multipleQuestionStackView.isHidden = false
        
        for (label, answer) in zip(multipleQuestionLabels, answers) {
            label.text = answer.title
        }
    }
    
    private func showRangedStack(with answers: [Answer]) {
        rangedQuestionStackView.isHidden = false
        
        rangedQuestionLabels.first?.text = answers.first?.title
        rangedQuestionLabels.last?.text = answers.last?.title
        
        
    }
}


