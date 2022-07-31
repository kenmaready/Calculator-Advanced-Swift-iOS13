//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var displayLabel: UILabel!
    private var currentDisplayNumber: String = "0"
    private var currentDisplayValue: Double {
        get {
            guard let number = Double(currentDisplayNumber) else {
                fatalError("Could not convert current display number \(currentDisplayNumber) to a Double.")
            }
            return number
        }
    }
    private var binaryOperationInProcess: Bool = false
        
    @IBAction private func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        if let keyPressed = sender.currentTitle {
                        
            switch keyPressed {
            case "AC":
                currentDisplayNumber = "0"
                refreshDisplay()
            case "+/-":
                if !currentDisplayNumber.contains(".") {
                    currentDisplayNumber = String(-Int(currentDisplayValue))
                } else if currentDisplayNumber.hasSuffix(".") {
                    currentDisplayNumber = String(-Int(currentDisplayValue)) + "."
                } else {
                    currentDisplayNumber = String(-currentDisplayValue)                    
                }
                refreshDisplay()
            case "%":
                currentDisplayNumber = String(currentDisplayValue / 100.0)
                refreshDisplay()
            default:
                return
            }
        }
    
    }

    
    @IBAction private func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        
        if let digitPressed = sender.currentTitle {
            if currentDisplayNumber.count < 13 {
                if currentDisplayNumber == "0" && digitPressed != "." {
                    currentDisplayNumber = digitPressed
                } else if digitPressed == "." && currentDisplayNumber.contains(".") {
                        return
                } else {
                    currentDisplayNumber += digitPressed
                }
                refreshDisplay()
            }
        }
    }
    
    private func refreshDisplay() {
        displayLabel.text = currentDisplayNumber
    }

}

