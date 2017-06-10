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
    }
    @IBAction func Sign(_ sender: Any) {
    }
    @IBAction func Dot(_ sender: Any) {
    }
    @IBAction func Percent(_ sender: Any) {
    }
    
    @IBAction func Multiplication(_ sender: Any) {
    }
    @IBAction func Division(_ sender: Any) {
    }
    @IBAction func Addition(_ sender: Any) {
    }
    @IBAction func Subtraction(_ sender: Any) {
    }
    
    @IBAction func Zero(_ sender: UIButton) {
    }
    @IBAction func One(_ sender: UIButton) {
    }
    @IBAction func Two(_ sender: UIButton) {
    }
    @IBAction func Three(_ sender: UIButton) {
    }
    @IBAction func Four(_ sender: UIButton) {
    }
    @IBAction func Five(_ sender: UIButton) {
    }
    @IBAction func Six(_ sender: UIButton) {
    }
    @IBAction func Seven(_ sender: UIButton) {
    }
    @IBAction func Eight(_ sender: UIButton) {
    }
    @IBAction func Nine(_ sender: UIButton) {
    }
    
    @IBAction func Equal(_ sender: UIButton) {
    }
}

