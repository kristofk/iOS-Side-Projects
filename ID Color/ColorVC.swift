//
//  ColorVC.swift
//  ID Color
//
//  Created by Kristof Kocsis on 2017. 06. 29..
//  Copyright © 2017. Kristof Kocsis. All rights reserved.
//

import UIKit

class ColorVC: UIViewController {

    
    // MARK: - Outlets
    
    @IBOutlet var imageDisplay: UIImageView!
    @IBOutlet var colorViewer: UILabel!
    @IBOutlet var redValue: UILabel!
    @IBOutlet var greenValue: UILabel!
    @IBOutlet var blueValue: UILabel!
    @IBOutlet var cancelView: UIImageView!
    @IBOutlet var xButton: UIButton!
    @IBOutlet var saveButton: UIButton!
    let image: UIImage
    
    
    // MARK: - Actions
    
    @IBAction func imageTap(_ sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            let location = sender.location(in: imageDisplay)

            let colorAtLocation = imageDisplay.getPixelColorAt(point: location)
            
            let rgbValues = colorAtLocation.rgb()
            let rValue = rgbValues!.red
            let gValue = rgbValues!.green
            let bValue = rgbValues!.blue
            redValue.text = "\(String(describing: rValue))"
            greenValue.text = "\(String(describing: gValue))"
            blueValue.text = "\(String(describing: bValue))"
            
            colorViewer.backgroundColor = colorAtLocation
        }
    }
    
    @IBAction func xPress(_ sender: UIButton) {
        removeSubView()
    }
    
    @IBAction func save(_ sender: UIButton) {
        let imageData = UIImageJPEGRepresentation(imageDisplay.image!, 0)
        let compressedJPGImage = UIImage(data: imageData!)
        UIImageWriteToSavedPhotosAlbum(compressedJPGImage!, nil, nil, nil)
        
        let message = UIAlertController(title: "Saved successfully", message: "The image has been saved to your photo library", preferredStyle: .alert)
        message.show(self, sender: sender)
    }
    
    
    // MARK: - init
    
    init(image: UIImage) {
        self.image = image
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageDisplay.image = image
        xButton.setImage(#imageLiteral(resourceName: "cancel"), for: .normal)
        saveButton.setImage(#imageLiteral(resourceName: "save"), for: .normal)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    /// Removes the ColorVC view form the main view.
    
    func removeSubView() {
        let remView = self.view.viewWithTag(0)
        remView?.removeFromSuperview()
    }
    

}
