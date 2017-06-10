//
//  ViewController.swift
//  Stock Calculator
//
//  Created by Kristof Kocsis on 2017. 06. 06..
//  Copyright © 2017. Kristof Kocsis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func clearDisplay() {
        Display.text = ""
    }
    
    func numberInput(sender: UIButton) {
        if isFirstNum {
            isFirstNum = false
            clearDisplay()
        }
        Display.text! += sender.currentTitle!
    }
    
    func updateDisplay(with value: String) {
        Display.text = value
    }
    
    func shiftNumbers() {
        prevNum = currentNum
        currentNum = 0
        isFirstNum = true
    }
    
    @IBOutlet weak var AC_C: UIButton!
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
    
    @IBOutlet weak var Display: UILabel!
    
    @IBAction func AC_C(_ sender: UIButton) {
        if sender.currentTitle! == "C" {
            Display.text = "0"
            isFirstNum = true
        } else {
            Display.text = "0"
            prevNum = 0
            currentNum = 0
            isFirstNum = true
            operation = .empty
        }
        updateACC()
        
    }
    @IBAction func Sign(_ sender: Any) {
        updateACC()
        
    }
    @IBAction func Percent(_ sender: Any) {
        updateACC()
        
    }
    @IBAction func Multiplication(_ sender: Any) {
        
        if !isFirstNum {
            shiftNumbers()
        }
        operation = .multiplication
        updateACC()
    }
    @IBAction func Division(_ sender: Any) {
        if !isFirstNum {
            shiftNumbers()
        }
        operation = .division
        updateACC()
    }
    @IBAction func Addition(_ sender: Any) {
        if !isFirstNum {
            shiftNumbers()
        }
        operation = .addition
        updateACC()
    }
    @IBAction func Subtraction(_ sender: Any) {
        if !isFirstNum {
            currentNum = Double(Display.text!)!
            shiftNumbers()
        }
        operation = .subtraction
        updateACC()
    }
    @IBAction func Dot(_ sender: Any) {
        updateACC()
    }
    
    @IBAction func Nine(_ sender: UIButton) {
        numberInput(sender: sender)
        updateACC()
    }
    @IBAction func Eight(_ sender: UIButton) {
        numberInput(sender: sender)
        updateACC()
    }
    @IBAction func Seven(_ sender: UIButton) {
        numberInput(sender: sender)
        updateACC()
    }
    @IBAction func Six(_ sender: UIButton) {
        numberInput(sender: sender)
        updateACC()
    }
    @IBAction func Five(_ sender: UIButton) {
        numberInput(sender: sender)
        updateACC()
    }
    @IBAction func Four(_ sender: UIButton) {
        numberInput(sender: sender)
        updateACC()
    }
    @IBAction func Three(_ sender: UIButton) {
        numberInput(sender: sender)
        updateACC()
    }
    @IBAction func Two(_ sender: UIButton) {
        numberInput(sender: sender)
        updateACC()
    }
    @IBAction func One(_ sender: UIButton) {
        numberInput(sender: sender)
        updateACC()
    }
    @IBAction func Zero(_ sender: UIButton) {
        numberInput(sender: sender)
        updateACC()
    }
    
    @IBAction func Equal(_ sender: UIButton) {
        var result: Double
        currentNum = Double(Display.text!)!
        if isFirstNum{
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
                result = prevNum
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
        
        updateDisplay(with: String(result))
        isFirstNum = true
        updateACC()
    }
    
}

