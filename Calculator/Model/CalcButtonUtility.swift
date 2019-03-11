//
//  CalcButtons.swift
//  Calculator
//
//  Created by Michael Agee on 3/10/19.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import Foundation
import UIKit

enum CalcButton: String {
    case clear = "AC"
    case percent = "%"
    case plusMinus = "+/-"
    case equalSign = "="
}

enum Operations: String {
    case multiply = "×"
    case add = "+"
    case subtract = "-"
    case divide = "÷"
}

struct CalcButtonUtility {
    private var number: Double?
    
    private var intermediateCalculation: (n1: Double, calcMethod: String)?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    mutating func calcFunction (symbol: String) -> Double? {
        
        if let n = number {
            switch symbol {
            case  CalcButton.plusMinus.rawValue:
                return n * -1
            case CalcButton.clear.rawValue:
                return 0
            case CalcButton.percent.rawValue:
                return n * 0.01
            case CalcButton.equalSign.rawValue:
                return performCalculation(n2: n)
            default:
                intermediateCalculation = (n1: n, calcMethod: symbol)
            }
        }
        return nil
    }
    
    private func performCalculation(n2: Double) -> Double? {
        
        if let n1 = intermediateCalculation?.n1,
            let operation = intermediateCalculation?.calcMethod {
            switch operation {
            case Operations.add.rawValue:
                return n1 + n2
            case Operations.multiply.rawValue:
                return n1 * n2
            case Operations.subtract.rawValue:
                return n1 - n2
            case Operations.divide.rawValue:
                return n1 / n2
            default:
                fatalError("The operation pass does not match ony case")
            }
        }
        return nil
    }
}
