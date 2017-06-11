//
//  ViewController.swift
//  Stock Calculator
//
//  Created by Kristof Kocsis on 2017. 06. 06..
//  Copyright © 2017. Kristof Kocsis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Functions
    func clearDisplay() {
        Display.text = ""
    }
    func updateDisplay(with value: String) {
        Display.text = value
    }
    
    func numberInput(sender: UIButton) {
        if isFirstNum { clearDisplay() }
        isFirstNum = false
        Display.text! += sender.currentTitle!
    }
    
    func shiftNumbers() {
        prevNum = currentNum
        currentNum = 0
        isFirstNum = true
    }
    
    func updateACC() {
        if isFirstNum {
            AC_C.setTitle("AC", for: .normal)
        } else {
            AC_C.setTitle("C", for: .normal)
        }
    }
    
    var prevNum: Double = 0
    var currentNum: Double = 0
    var isFirstNum = true
    var operation: Operation = .empty
    
    
    // MARK: - Output
    @IBOutlet weak var Display: UILabel!
    @IBOutlet weak var AC_C: UIButton!
    
    // MARK: - Buttons
    @IBAction func AC_C(_ sender: UIButton) {
        if AC_C.currentTitle! == "AC" {
            prevNum = 0
            currentNum = 0
            isFirstNum = true
            operation = .empty
        } else {
            currentNum = 0
            isFirstNum = true
        }
        Display.text = "0"
        updateACC()
    }
    
    @IBAction func Sign(_ sender: Any) {
        var number = Double(Display.text!)!
        number = toggleSign(number: number)
        Display.text = String(number)
        updateACC()
    }
    
    @IBAction func Dot(_ sender: Any) {
        if isFirstNum {
            Display.text! += "0"
        }
        Display.text! += "."
        updateACC()
    }
    
    @IBAction func Percent(_ sender: Any) {
        switch operation {
        case .empty:
            var number = Double(Display.text!)!
            number = percent(for: number)
            Display.text = String(number)
        default:
            var number = Double(Display.text!)!
            number = percent(for: number)
            number = prevNum * number
            Display.text = String(number)
        }
        updateACC()
    }
    
    @IBAction func Multiplication(_ sender: Any) {
        currentNum = Double(Display.text!)!
        shiftNumbers()
        operation = .multiplication
        updateACC()
    }
    @IBAction func Division(_ sender: Any) {
        currentNum = Double(Display.text!)!
        shiftNumbers()
        operation = .division
        updateACC()
    }
    @IBAction func Addition(_ sender: Any) {
        currentNum = Double(Display.text!)!
        shiftNumbers()
        operation = .addition
        updateACC()
    }
    @IBAction func Subtraction(_ sender: Any) {
        currentNum = Double(Display.text!)!
        shiftNumbers()
        operation = .subtraction
        updateACC()
    }
    
    @IBAction func Zero(_ sender: UIButton) {
        numberInput(sender: sender)
        updateACC()
    }
    @IBAction func One(_ sender: UIButton) {
        numberInput(sender: sender)
        updateACC()
    }
    @IBAction func Two(_ sender: UIButton) {
        numberInput(sender: sender)
        updateACC()
    }
    @IBAction func Three(_ sender: UIButton) {
        numberInput(sender: sender)
        updateACC()
    }
    @IBAction func Four(_ sender: UIButton) {
        numberInput(sender: sender)
        updateACC()
    }
    @IBAction func Five(_ sender: UIButton) {
        numberInput(sender: sender)
        updateACC()
    }
    @IBAction func Six(_ sender: UIButton) {
        numberInput(sender: sender)
        updateACC()
    }
    @IBAction func Seven(_ sender: UIButton) {
        numberInput(sender: sender)
        updateACC()
    }
    @IBAction func Eight(_ sender: UIButton) {
        numberInput(sender: sender)
        updateACC()
    }
    @IBAction func Nine(_ sender: UIButton) {
        numberInput(sender: sender)
        updateACC()
    }
    
    @IBAction func Equal(_ sender: UIButton) {
        
        currentNum = Double(Display.text!)!
        var result = currentNum
        if isFirstNum {
            switch operation {
            case .addition:
                 result = add(to: prevNum, value: prevNum)
            case .subtraction:
                 result = subtract(from: prevNum, value: prevNum)
            case .multiplication:
                 result = multiply(base: prevNum, by: prevNum)
            case .division:
                 result = divide(base: prevNum, by: prevNum)
            case .empty:
                 result = currentNum
            }
        } else {
            switch operation {
            case .addition:
                 result = add(to: prevNum, value: currentNum)
            case .subtraction:
                 result = subtract(from: prevNum, value: currentNum)
            case .multiplication:
                 result = multiply(base: prevNum, by: currentNum)
            case .division:
                 result = divide(base: prevNum, by: currentNum)
            case .empty:
                 result = currentNum
            }
        }
        currentNum = result
        Display.text = String(currentNum)
        shiftNumbers()
        isFirstNum = true
        updateACC()
    }
}

