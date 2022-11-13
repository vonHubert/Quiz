//
//  ResultsViewController.swift
//  Quiz
//
//  Created by MacBook Air 13 on 13.11.2022.
//

import UIKit

class ResultsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func doneButtonTapped(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
        
    }
    
    deinit{
        print("ResultsVC has been delocated")
    }
}
