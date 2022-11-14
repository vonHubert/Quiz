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
            rangedQuestionSlider.value = answerCount / 2
        }
    }
    
    // MARK: - Private Properties
    private let questions = Question.getQuestions()
    private var questionIndeх = 0
    private var chosenAnswers: [Answer] = []
    private var currentAnswers: [Answer] { questions[questionIndeх].answers }
    
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
    }
    
    @IBAction func multipleAnswerButtonTapped() {
        for (multipleSwitch, answer) in zip(multipleQuestionSwitches, currentAnswers) {
            if multipleSwitch.isOn {
                chosenAnswers.append(answer)
            }
        }
        goToNextQuestion()
    }
    
    @IBAction func rangedAnswerButtonTapped() {
        let index = lrintf(rangedQuestionSlider.value)
        chosenAnswers.append(chosenAnswers[index])
        
        goToNextQuestion()
    }
}

// MARK: - Navigation
extension QuestionsViewController {
    private func goToNextQuestion() {
        questionIndeх += 1
        if questionIndeх < questions.count {
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
        let currentQuestion = questions[questionIndeх]
        
        // Set current quesion for question label
        questionTextLabel.text = currentQuestion.title
        
        // Calculete current progress
        let totalProgress = Float(questionIndeх) / Float(questions.count)
        
        // Set progressView
        questionProgressView.setProgress(totalProgress, animated: true)
        
        // Set navigation title
        title = "Вопрос № \(questionIndeх + 1) из \(questions.count)"
        
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


