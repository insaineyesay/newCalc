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
            // TODO: - fix this, it's allowing double decimal points and causing the app to crash
            // problem starts on line 60 " if numValue == "." {"
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
    
    
    private var calculator = CalcButtonUtility()

    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        isFinishedTypingNumber = true
        
        calculator.setNumber(displayValue)
        
        if let calcMethod = sender.currentTitle {
            if let result = calculator.calcFunction(symbol: calcMethod) {
                displayValue = result
            }
            
            
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
//                    guard let currentDisplayValue = Double(displayLabel.text!) else {
//                        fatalError("Cannot convert display label text to a double")
//                    }
                    let isInt = floor(displayValue) == displayValue
                    if !isInt && displayLabel.text!.contains(".") {
                        return
                    }
                }
                displayLabel.text = displayLabel.text! + numValue
            }
            
        }
    }

}

