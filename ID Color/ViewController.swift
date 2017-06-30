//
//  ViewController.swift
//  ID Color
//
//  Created by Kristof Kocsis on 2017. 06. 29..
//  Copyright © 2017. Kristof Kocsis. All rights reserved.
//

import UIKit
import SwiftyCam

class ViewController: SwiftyCamViewController, SwiftyCamViewControllerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    func IDColor(photo: UIImage) {
        let colorView = ColorVC(image: photo)
        self.addChildViewController(colorView)
        self.view.addSubview(colorView.view)
        print("ColorView tag: \(colorView.view.tag)")
    }
    func swiftyCam(_ swiftyCam: SwiftyCamViewController, didTake photo: UIImage) {
        IDColor(photo: photo)
    }
    
    func addCaptureButton() {
        let captureButtonFrame = CGRect(x: view.frame.midX - 37.5, y: view.frame.height - 100.0, width: 75.0, height: 75.0)
        let captureButton = SwiftyCamButton(frame: captureButtonFrame)
        self.view.addSubview(captureButton)
        captureButton.setImage(#imageLiteral(resourceName: "focus"), for: .normal)
        captureButton.delegate = self
    }
    
    func addMediaButton() {
        let mediaButtonFrame = CGRect(x: 50, y: view.frame.height - 100.0, width: 44, height: 44)
        let button = UIButton(frame: mediaButtonFrame)
        
        button.setImage(#imageLiteral(resourceName: "media"), for: .normal)
        button.addTarget(self, action: #selector(mediaButtonAction), for: .touchUpInside)
        
        self.view.addSubview(button)
    }
    
    func mediaButtonAction(sender: UIButton!) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary;
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
//            imagePost.image = image
            IDColor(photo: image)
        } else{
            print("Something went wrong")
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        cameraDelegate = self
        addCaptureButton()
        addMediaButton()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
