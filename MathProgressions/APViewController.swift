//
//  APViewController.swift
//  MathProgressions
//
//  Created by Kristof Kocsis on 2017. 11. 04..
//  Copyright © 2017. kristofk. All rights reserved.
//

import UIKit

class APViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // Hide keyboard: touch outside
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBOutlet weak var snValue: UITextField!
    @IBOutlet weak var anValue: UITextField!
    @IBOutlet weak var a1Value: UITextField!
    @IBOutlet weak var dValue: UITextField!
    @IBOutlet weak var nValue: UITextField!
    
    @IBAction func go(_ sender: UIButton) {
        self.view.endEditing(true)
        
        let snNum = Double(snValue.text!) ?? nil
        let anNum = Double(anValue.text!) ?? nil
        let a1Num = Double(a1Value.text!) ?? nil
        let dNum = Double(dValue.text!) ?? nil
        let nNum = Double(nValue.text!) ?? nil
        
        let result = apFormula(sn: snNum, an: anNum, a1: a1Num, n: nNum, d: dNum)
        
        
        if let result = result {
            snValue.text = String(result.0)
            anValue.text = String(result.1)
            a1Value.text = String(result.2)
            dValue.text = String(result.4)
            nValue.text = String(result.3)
        } else {
            let alert = UIAlertController(title: "No Solution", message: "Couldn't find the solution to this problem!", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func clear(_ sender: UIButton) {
        snValue.text = ""
        anValue.text = ""
        a1Value.text = ""
        dValue.text = ""
        nValue.text = ""
    }
    

}
