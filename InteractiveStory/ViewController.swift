//
//  ViewController.swift
//  InteractiveStory
//
//  Created by Kristof Kocsis on 2017. 12. 05..
//  Copyright © 2017. Kristof Kocsis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var nameTextField: UITextField!
	@IBOutlet weak var textFieldButtomContraint: NSLayoutConstraint!
	
	override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
		
		NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyborardWillShow(_:)), name: Notification.Name.UIKeyboardWillShow, object: nil)
		
		NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillHide(_:)), name: Notification.Name.UIKeyboardWillHide, object: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "startAdventure" {
			
			do {
				if let name = nameTextField.text {
					if name == "" {
						throw AdventureError.nameNotProvided
					} else {
						guard let pageController = segue.destination as? PageController else { return }
						
						pageController.page = Adventure.story(name: name)
					}
				}
			} catch AdventureError.nameNotProvided {
				let alertController = UIAlertController(title: "name not provided", message: "provide a name to start the story", preferredStyle: .alert)
				
				let action = UIAlertAction(title: "OK", style: .default, handler: nil)
				alertController.addAction(action)
				
				present(alertController, animated: true, completion: nil)
			} catch let error {
				fatalError("\(error.localizedDescription)")
			}
			
			
        }
    }

	@objc func keyborardWillShow(_ notification: Notification) {
		if let info = notification.userInfo, let keyboardFrame =  info[UIKeyboardFrameEndUserInfoKey] as? NSValue {
			let frame = keyboardFrame.cgRectValue
			textFieldButtomContraint.constant = frame.size.height + 10
			
			UIView.animate(withDuration: 0.8) {
				self.view.layoutIfNeeded()
			}
		}
	}
	
	@objc func keyboardWillHide(_ notification: Notification) {
		textFieldButtomContraint.constant = 40
		UIView.animate(withDuration: 0.8) {
			self.view.layoutIfNeeded()
		}
	}

	deinit {
		NotificationCenter.default.removeObserver(self)
	}
}


extension ViewController: UITextFieldDelegate {
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		return true
	}
}







