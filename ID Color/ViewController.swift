//
//  ViewController.swift
//  ID Color
//
//  Created by Kristof Kocsis on 2017. 06. 29..
//  Copyright © 2017. Kristof Kocsis. All rights reserved.
//

import UIKit
import SwiftyCam

class ViewController: SwiftyCamViewController, SwiftyCamViewControllerDelegate {

    func swiftyCam(_ swiftyCam: SwiftyCamViewController, didTake photo: UIImage) {
        let colorView = ColorVC(image: photo)
        self.addChildViewController(colorView)
        self.view.addSubview(colorView.view)
        print("ColorView tag: \(colorView.view.tag)")
    }
    
    
    
    func addCaptureButton() {
        let buttonFrame = CGRect(x: view.frame.midX - 37.5, y: view.frame.height - 100.0, width: 75.0, height: 75.0)
        let captureButton = SwiftyCamButton(frame: buttonFrame)
        self.view.addSubview(captureButton)
        captureButton.setImage(#imageLiteral(resourceName: "focus"), for: .normal)
        captureButton.delegate = self
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        cameraDelegate = self
        addCaptureButton()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

