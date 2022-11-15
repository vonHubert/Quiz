//
//  ResultsViewController.swift
//  Quiz
//
//  Created by MacBook Air 13 on 13.11.2022.
//

import UIKit

class ResultsViewController: UIViewController {
    // MARK: - IBOutlets
    
    
    // MARK: - Received Properties
    var chosenAnswers: [Answer]!
    var extractedAnimals: [Animal] = []
    var animalFrequency: [Animal : Int] = [
        Quiz.Animal.dog : 0,
        Quiz.Animal.cat : 0,
        Quiz.Animal.rabbit : 0,
        Quiz.Animal.turtle : 0
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: false)
    }
    
    // MARK: - IBActions:
    @IBAction func doneButtonTapped(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
        
    }
    
    @IBAction func printAnswersForTesting(_ sender: Any) {
        
        print("results structure:")
        extractAnimals()
        calculateAnimalFrequency()
        print(animalFrequency)
    }
    
    // MARK: - Answer calculation
    
    private func extractAnimals() {
        for answer in chosenAnswers {
            extractedAnimals.append(answer.animal)
        }
    }
    
    private func calculateAnimalFrequency() {
        for animal in extractedAnimals {
            if animal == Quiz.Animal.dog {
                animalFrequency[Quiz.Animal.dog]! += 1
            } else if animal == Quiz.Animal.cat {
                animalFrequency[Quiz.Animal.cat]! += 1
            } else if animal == Quiz.Animal.rabbit {
                animalFrequency[Quiz.Animal.rabbit]! += 1
            } else {
                animalFrequency[Quiz.Animal.turtle]! += 1
                
            }
            
            
            
            
        }
    }
}
