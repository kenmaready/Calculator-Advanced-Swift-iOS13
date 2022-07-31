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
    private var calc = Calculator()
        
    @IBAction private func unaryOperatorPressed(_ sender: UIButton) {
        //What should happen when AC, +/-, % or = is pressed
        if let keyPressed = sender.currentTitle {
            calc.processUnaryOperator(keyPressed)
            refreshDisplay()
        }
    }

    @IBAction func binaryOperatorPressed(_ sender: UIButton) {
        //What should happen when +, -, * or / is pressed
        if let keyPressed = sender.currentTitle {
            calc.processBinaryOperator(keyPressed)
            refreshDisplay()
        }
    }
    
    @IBAction private func numButtonPressed(_ sender: UIButton) {
        //What should happen when a number is entered into the keypad
        if let digitPressed = sender.currentTitle {
            calc.processNumKey(digitPressed)
            refreshDisplay()
        }
    }
    
    private func refreshDisplay() {
        displayLabel.text = calc.displayString
    }

}

