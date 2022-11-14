//
//  ResultsViewController.swift
//  Quiz
//
//  Created by MacBook Air 13 on 13.11.2022.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var chosenAnswers: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func doneButtonTapped(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
        
    }
    
    @IBAction func printAnswersForTesting(_ sender: Any) {
        print("results structure:")
        print(chosenAnswers)
    }
    
    deinit{
        print("ResultsVC has been delocated")
    }
}
