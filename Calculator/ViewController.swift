//
//  ViewController.swift
//  Calculator
//
//  Created by ZhangChuanhui on 5/23/17.
//  Copyright © 2017 ZhangChuanhui. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var display: UILabel!
    
    private var userIsInMiddleOfTyping = false
    
    @IBAction private func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        
        if userIsInMiddleOfTyping {
            let textCurrentlyInText = display.text!
            display.text = textCurrentlyInText + digit
        } else {
            display.text = digit
        }
        
        userIsInMiddleOfTyping = true

    }
    
    private var displayValue: Double {
        get {
            return Double(display.text!)!
        }
        set {
            display.text = String(newValue)
        }
    }
    
    private var brain = CalculatorBrain()
    
    @IBAction private func performOperation(_ sender: UIButton) {
        
        if userIsInMiddleOfTyping {
            brain.setOperand(operand: displayValue)
            userIsInMiddleOfTyping = false
        }
        
        if let mathmaticalSymbol = sender.currentTitle {
            brain.performOperation(symbol: mathmaticalSymbol)
            displayValue = brain.result
        }
        
    }
}
