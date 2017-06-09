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
    
    var prevNum: Double = 0
    var currentNum: Double = 0
    var isFirstNum = true
    var operation: Operation = .empty
    
    @IBOutlet weak var Display: UILabel!
    
    @IBAction func AC_C(_ sender: Any) {
    }
    @IBAction func Sign(_ sender: Any) {
        
    }
    @IBAction func Percent(_ sender: Any) {
        operation = .percent
    }
    @IBAction func Multiplication(_ sender: Any) {
        operation = .multiplication
    }
    @IBAction func Division(_ sender: Any) {
        operation = .division
    }
    @IBAction func Addition(_ sender: Any) {
        operation = .addition
    }
    @IBAction func Subtraction(_ sender: Any) {
        operation = .subtraction
    }
    @IBAction func Dot(_ sender: Any) {
    }
    
    @IBAction func Nine(_ sender: UIButton) {
        if isFirstNum {
            
        }
    }
    @IBAction func Eight(_ sender: Any) {
    }
    @IBAction func Seven(_ sender: Any) {
    }
    @IBAction func Six(_ sender: Any) {
    }
    @IBAction func Five(_ sender: Any) {
    }
    @IBAction func Four(_ sender: Any) {
    }
    @IBAction func Three(_ sender: Any) {
    }
    @IBAction func Two(_ sender: Any) {
    }
    @IBAction func One(_ sender: Any) {
    }
    @IBAction func Zero(_ sender: Any) {
    }

    @IBAction func Equal(_ sender: Any) {
    }

}

