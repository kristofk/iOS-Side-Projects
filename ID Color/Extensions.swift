//
//  Extensions.swift
//  ID Color
//
//  Created by Kristof Kocsis on 2017. 06. 29..
//  Copyright © 2017. Kristof Kocsis. All rights reserved.
//

import UIKit

extension UIImage {
    
    /**
     
     Returns the color of the pixel of the image at the given position.
     NO USE FOR IT IN THIS PROJECT, KEPT IT JUST IN CASE
     
     - parameter pos: The position in CGPoint that determines the pixel the color of which we want returned.
     
     - returns: The color of the pixel in UIColor class.
     
     */
    
    public func getPixelColor(pos: CGPoint) -> UIColor {
        
        let pixelData = self.cgImage!.dataProvider!.data
        let data: UnsafePointer<UInt8> = CFDataGetBytePtr(pixelData)
        
        let pixelInfo: Int = ((Int(self.size.width) * Int(pos.y)) + Int(pos.x)) * 4
        
        let r = CGFloat(data[pixelInfo]) / CGFloat(255.0)
        let g = CGFloat(data[pixelInfo+1]) / CGFloat(255.0)
        let b = CGFloat(data[pixelInfo+2]) / CGFloat(255.0)
        let a = CGFloat(data[pixelInfo+3]) / CGFloat(255.0)
        
        return UIColor(red: r, green: g, blue: b, alpha: a)
    }
}

extension UIColor {
    
    /**
     
     Returns the R, G, B, and A values from a UIColor instance.
     
     - returns: Int between 0...255 OR nil if an error occured
     
     */
    public func rgb() -> (red:Int, green:Int, blue:Int, alpha:Int)? {
        var fRed : CGFloat = 0
        var fGreen : CGFloat = 0
        var fBlue : CGFloat = 0
        var fAlpha: CGFloat = 0
        if self.getRed(&fRed, green: &fGreen, blue: &fBlue, alpha: &fAlpha) {
            let iRed = Int(fRed * 255.0)
            let iGreen = Int(fGreen * 255.0)
            let iBlue = Int(fBlue * 255.0)
            let iAlpha = Int(fAlpha * 255.0)
            
            return (red:iRed, green:iGreen, blue:iBlue, alpha:iAlpha)
        } else {
            // Could not extract RGBA components:
            return nil
        }
    }
}


extension UIImageView {
    
    /**
     Returns the color of the pixel at a given point.
     
     - parameter point: Specifies the position of the pixel returned.
     
     - returns: the UIColor of the given pixel
     
     */
    
    func getPixelColorAt(point:CGPoint) -> UIColor{
        
        let pixel = UnsafeMutablePointer<CUnsignedChar>.allocate(capacity: 4)
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.premultipliedLast.rawValue)
        let context = CGContext(data: pixel, width: 1, height: 1, bitsPerComponent: 8, bytesPerRow: 4, space: colorSpace, bitmapInfo: bitmapInfo.rawValue)
        
        context!.translateBy(x: -point.x, y: -point.y)
        layer.render(in: context!)
        let color:UIColor = UIColor(red: CGFloat(pixel[0])/255.0,
                                    green: CGFloat(pixel[1])/255.0,
                                    blue: CGFloat(pixel[2])/255.0,
                                    alpha: CGFloat(pixel[3])/255.0)
        
        pixel.deallocate(capacity: 4)
        return color
    }
}

/**
 
 Returns the color of the pixel at a given point from any Class that inherites from UIView.
 THIS FUNCTION DOESN'T HAVE A USE IN THIS PROJECT, JUST KEPT IT FOR SCALEBILITY.
 
 - parameter point: Specifies the location of the point from which the Color will be returned.
 
 - parameter sourceView: Specifies the View or any other subclass of view that displays the image.
 
 - returns: the UIColor of the given pixel.
 
 */

func getPixelColorAtPoint(point:CGPoint, sourceView: UIView) -> UIColor{
    
    let pixel = UnsafeMutablePointer<CUnsignedChar>.allocate(capacity: 4)
    let colorSpace = CGColorSpaceCreateDeviceRGB()
    let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.premultipliedLast.rawValue)
    let context = CGContext(data: pixel, width: 1, height: 1, bitsPerComponent: 8, bytesPerRow: 4, space: colorSpace, bitmapInfo: bitmapInfo.rawValue)
    
    context!.translateBy(x: -point.x, y: -point.y)
    sourceView.layer.render(in: context!)
    let color:UIColor = UIColor(red: CGFloat(pixel[0])/255.0,
                                green: CGFloat(pixel[1])/255.0,
                                blue: CGFloat(pixel[2])/255.0,
                                alpha: CGFloat(pixel[3])/255.0)
    
    pixel.deallocate(capacity: 4)
    return color
}


