//
//  ViewController.swift
//  ID Color
//
//  Created by Kristof Kocsis on 2017. 06. 29..
//  Copyright © 2017. Kristof Kocsis. All rights reserved.
//

import UIKit
import SwiftyCam
import GoogleMobileAds

class ViewController: SwiftyCamViewController, SwiftyCamViewControllerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, GADBannerViewDelegate {

    
    // MARK: - SiwftyCam functions
    
    func swiftyCam(_ swiftyCam: SwiftyCamViewController, didTake photo: UIImage) {
        IDColor(photo: photo)
    }
    
    
    //MARK: - Custom functions
    
    /**
     
     Brings up the ColorVC view with the desired picture.
     
     - parameter photo: The picture that will be displayed in the new view
     
     */
    
    func IDColor(photo: UIImage) {
        let colorView = ColorVC(image: photo)
        self.addChildViewController(colorView)
        self.view.addSubview(colorView.view)
        print("ColorView tag: \(colorView.view.tag)")
    }

    /// Adds the default SwiftyCam capture button to the view.
    
    func addCaptureButton() {
        let captureButtonFrame = CGRect(x: view.frame.midX - 37.5, y: view.frame.height - 110.0, width: 75.0, height: 75.0)
        let captureButton = SwiftyCamButton(frame: captureButtonFrame)
        self.view.addSubview(captureButton)
        captureButton.setImage(#imageLiteral(resourceName: "focus"), for: .normal)
        captureButton.delegate = self
    }
    
    /// Adds a media selector button that opens up Photo Library
    
    func addMediaButton() {
        let mediaButtonFrame = CGRect(x: view.frame.midX - 22, y: view.frame.height - 45, width: 44, height: 44)
        let button = UIButton(frame: mediaButtonFrame)
        
        button.setImage(#imageLiteral(resourceName: "media"), for: .normal)
        button.addTarget(self, action: #selector(mediaButtonAction), for: .touchUpInside)
        
        self.view.addSubview(button)
    }
    
    /**
     
     This is the function called by the media button. It opens up the Photo Library.
     
     - parameter sender: Speifies the sender that calls this function. THIS ISN'T IMPORTANT FOR THE FUNCTIONING OF THE FUNCTION.
     
     */
    
    func mediaButtonAction(sender: UIButton!) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary;
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    /// When the user selected a picture this function is called to return the picture.
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            IDColor(photo: image)
        } else{
            print("Something went wrong")
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    // MARK: - VeiwController functions
    
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
    
    // MARK: - AdMob func
    
    func createAdMobRequest() -> GADRequest {
        let request = GADRequest()
        request.testDevices = [ kGADSimulatorID, "c4868a24863d9af44e24cd3aff515a37"]
        
        return request
    }
    
    func createAdMobBannerView(request: GADRequest) {
        var bannerView: GADBannerView!
        
        bannerView = GADBannerView(adSize: kGADAdSizeFullBanner)
        self.view.addSubview(bannerView)
        bannerView.rootViewController = self
        
        bannerView.adUnitID = "ca-app-pub-5958170520650541/7129119711"//"ca-app-pub-3940256099942544/2934735716"
        
        bannerView.load(request)
        bannerView.delegate = self
    }


}
