//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2018.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    private var isFinishedTypingNumber: Bool = true
    private var displayValue: Double {
        get {
            guard let currentDisplayValue = Double(displayLabel.text!) else {
                fatalError("Cannot convert display label text to a double")
            }
            return currentDisplayValue
        }
        
        set {
            displayLabel.text = String(newValue)
        }
    }
    @IBOutlet weak var displayLabel: UILabel!
    
    
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        isFinishedTypingNumber = true
        
        
        if let calcMethod = sender.currentTitle {
            let calculator = CalcButtonUtility(number: displayValue)
            guard let result = calculator.calcFunction(symbol: calcMethod) else {
                fatalError("The result of the calculation is nil")
            }
            
            displayValue = result
        }
        
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        if let numValue = sender.currentTitle {
            if isFinishedTypingNumber {
                displayLabel.text = numValue
                isFinishedTypingNumber = false
            } else {
                if numValue == "." {
                    
                    let isInt = floor(displayValue) == displayValue
                    if !isInt {
                        return
                    }
                }
                displayLabel.text = displayLabel.text! + numValue
            }
            
        }
    }

}

