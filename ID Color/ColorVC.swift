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
    let image: UIImage
    
    
    // MARK: - Actions
    
    @IBAction func imageTap(_ sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            let location = sender.location(in: imageDisplay)
            let widthFactor = image.size.width / imageDisplay.frame.width
            let heightFactor = image.size.height / imageDisplay.frame.height
            
            let scaledWidth = location.x * widthFactor
            let scaledHeight = location.y * heightFactor
            let scaledLocation = CGPoint(x: scaledWidth, y: scaledHeight)
            
            let colorAtLocation = image.getPixelColor(pos: scaledLocation)
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
//        print("Image size in points: \(image.size.width) x \(image.size.height)")
//        print("Image size in pixels: \(image.size.width * image.scale) x \(image.size.height * image.scale)")
//        print("Image display size: \(imageDisplay.frame.width) x \(imageDisplay.frame.height)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func removeSubView() {
        let remView = self.view.viewWithTag(0)
        remView?.removeFromSuperview()
    }
    
  
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
