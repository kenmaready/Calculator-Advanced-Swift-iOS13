//
//  Calculator.swift
//  Calculator
//
//  Created by Ken Maready on 7/31/22.
//  Copyright © 2022 London App Brewery. All rights reserved.
//

import Foundation

enum Operation {
    case add
    case subtract
    case multiply
    case divide
}


class Calculator {
    var displayString: String = "0"
    var displayValue: Double {
        get {
            guard let number = Double(displayString) else {
                fatalError("Could not convert current display number \(displayString) to a Double.")
            }
            return number
        }
    }
    
    var storedValue: Double?
    var storedOperation: Operation?
    var binaryOperationInProcess: Bool {
        get {
            return storedValue != nil
        }
    }
    
    func processNumKey(_ key: String) {
        if displayString.count >= 13 {
            return
        } else if displayString == "0" && key != "." {
            displayString = key
        } else if key == "." && displayString.contains(".") {
            return
        } else {
            displayString += key
        }
    }
    
    func processUnaryOperator(_ key: String) {
        switch key {
        case "AC":
            displayString = "0"
        case "+/-":
            if !displayString.contains(".") {
                displayString = String(-Int(displayValue))
            } else if displayString.hasSuffix(".") {
                displayString = String(-Int(displayValue)) + "."
            } else {
                displayString = String(-displayValue)
            }
        case "%":
            displayString = String(displayValue / 100.0)
        case "=":
            if binaryOperationInProcess {
                calculate()
            }
        default:
            return
        }
    }
    
    func processBinaryOperator(_ key: String) {
        switch key {
        case "÷":
            storedOperation = .divide
        case "×":
            storedOperation = .multiply
        case "-":
            storedOperation = .subtract
        case "+":
            storedOperation = .add
        default:
            return
        }
        storedValue = displayValue
        displayString = "0"
    }
    
    func calculate() {
        var result: Double
        switch storedOperation {
        case .divide:
            result = storedValue! / displayValue
        case .multiply:
            result = storedValue! * displayValue
        case .add:
            result = storedValue! + displayValue
        case .subtract:
            result = storedValue! - displayValue
        default:
            return
        }
        storedValue = nil
        storedOperation = nil
        displayString = String(result)
    }
}
