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
}

struct CalcButtonUtility {
    var number: Double
    
    init(number: Double) {
        self.number = number
    }
    
    func calcFunction (symbol: String) -> Double? {
        
            if symbol == CalcButton.plusMinus.rawValue {
                // cast right side into a string
                return number * -1
            }
            
            if symbol == CalcButton.clear.rawValue {
                return 0
            }
            
            if symbol == CalcButton.percent.rawValue {
                return number * 0.01
            }
            
        
        return nil
    }
}
