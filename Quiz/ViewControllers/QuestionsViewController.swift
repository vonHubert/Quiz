//
//  ViewController.swift
//  Quiz
//
//  Created by MacBook Air 13 on 12.11.2022.
//

import UIKit

class QuestionsViewController: UIViewController {
    
    // MARK: -IBOutlets
    @IBOutlet var questionTextLabel: UILabel!
    @IBOutlet var questionProgressVIew: UIProgressView!
    
    @IBOutlet var singleQuestionStackView: UIStackView!
    @IBOutlet var singleQuestionButtons: [UIButton]!
    
    @IBOutlet var multipleQuestionStackView: UIStackView!
    @IBOutlet var multipleQuestionLabels: [UILabel]!
    @IBOutlet var multipleQuestionSwitches: [UISwitch]!
    
    
    @IBOutlet var rangedQuestionStackView: UIStackView!
    @IBOutlet var rangedQuestionLabels: [UILabel]!
    @IBOutlet var rangedQuestionSlider: UISlider!
    
    // MARK: - Private Properties
    private let questions = Question.getQuestions()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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

