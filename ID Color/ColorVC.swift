//
//  ColorVC.swift
//  ID Color
//
//  Created by Kristof Kocsis on 2017. 06. 29..
//  Copyright © 2017. Kristof Kocsis. All rights reserved.
//

import UIKit

class ColorVC: UIViewController {

    @IBOutlet var imageDisplay: UIImageView!
    @IBOutlet var colorViewer: UILabel!
    @IBOutlet var redValue: UILabel!
    @IBOutlet var greenValue: UILabel!
    @IBOutlet var blueValue: UILabel!
    let image: UIImage
    
    func removeSubView() {
        let remView = self.view.viewWithTag(0)
        remView?.removeFromSuperview()
    }
    @IBAction func cancelTap(_ sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            removeSubView()
        }
    }
    
    @IBAction func imageTap(_ sender: UITapGestureRecognizer) {
        if sender.state == .ended {
        }
    }
    
    
    
    
    
    
    init(image: UIImage) {
        self.image = image
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imageDisplay.image = image
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
