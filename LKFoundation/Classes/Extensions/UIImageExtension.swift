//
//  UIImageExtension.swift
//  LKFoundation
//
//  Created by zhulinhua on 2018/4/25.
//

import Foundation
import UIKit

/// Degrees to radians conversion.
///
/// - Parameter degrees: Degrees to be converted.
/// - Returns: Returns the convertion result.
public func degreesToRadians(_ degrees: Float) -> Float {
    return Float(Double(degrees) * Double.pi / 180)
}

/// Radians to degrees conversion.
///
/// - Parameter radians: Radians to be converted.
/// - Returns: Returns the convertion result.
public func radiansToDegrees(_ radians: Float) -> Float {
    return Float(Double(radians) * 180 / Double.pi)
}


public extension UIImage {
    
    /// Create an image from a given rect of self.
    ///
    /// - Parameter rect:  Rect to take the image.
    /// - Returns: Returns the image from a given rect.
    public func crop(in rect: CGRect) -> UIImage {
        let imageRef: CGImage = self.cgImage!.cropping(to: CGRect(x: rect.origin.x * self.scale, y: rect.origin.y * self.scale, width: rect.size.width * self.scale, height: rect.size.height * self.scale))!
        let subImage: UIImage = UIImage(cgImage: imageRef, scale: self.scale, orientation: self.imageOrientation)
        
        return subImage
    }

    public func scale(toSize targetSize: CGSize) -> UIImage {
        let sourceImage: UIImage = self
        
        let targetWidth: CGFloat = targetSize.width
        let targetHeight: CGFloat = targetSize.height
        
        let scaledWidth: CGFloat = targetWidth
        let scaledHeight: CGFloat = targetHeight
        
        let thumbnailPoint: CGPoint = CGPoint(x: 0.0, y: 0.0)
        
        UIGraphicsBeginImageContextWithOptions(targetSize, false, UIImage.screenScale())
        
        var thumbnailRect: CGRect = CGRect.zero
        thumbnailRect.origin = thumbnailPoint
        thumbnailRect.size.width = scaledWidth
        thumbnailRect.size.height = scaledHeight
        
        sourceImage.draw(in: thumbnailRect)
        
        guard let newImage = UIGraphicsGetImageFromCurrentImageContext() else {
            UIGraphicsEndImageContext()
            return self
        }
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    /// Returns the screen scale, based on the device.
    ///
    /// - Returns: Returns the screen scale, based on the device.
    public static func screenScale() -> CGFloat {
        #if os(iOS)
        return UIScreen.main.scale
        #elseif os(watchOS)
        return WKInterfaceDevice.current().screenScale
        #endif
    }
    
    /// Rotate the image to the given radians.
    ///
    /// - Parameter radians: Radians to rotate to
    /// - Returns: Returns the rotated image.
    public func rotate(radians: Float) -> UIImage {
        return self.rotate(degrees: radiansToDegrees(radians))
    }
    
    /// Rotate the image to the given degrees.
    ///
    /// - Parameter degrees: Degrees to rotate to.
    /// - Returns: Returns the rotated image.
    public func rotate(degrees: Float) -> UIImage {
        let rotatedViewBox: UIView = UIView(frame: CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height))
        let transformation: CGAffineTransform = CGAffineTransform(rotationAngle: CGFloat(degreesToRadians(degrees)))
        rotatedViewBox.transform = transformation
        let rotatedSize: CGSize = CGSize(width: Int(rotatedViewBox.frame.size.width), height: Int(rotatedViewBox.frame.size.height))
        
        UIGraphicsBeginImageContextWithOptions(rotatedSize, false, UIImage.screenScale())
        guard let context: CGContext = UIGraphicsGetCurrentContext() else {
            UIGraphicsEndImageContext()
            return self
        }
        
        context.translateBy(x: rotatedSize.width / 2, y: rotatedSize.height / 2)
        
        context.rotate(by: CGFloat(degreesToRadians(Float(degrees))))
        
        context.scaleBy(x: 1.0, y: -1.0)
        context.draw(self.cgImage!, in: CGRect(x: -self.size.width / 2, y: -self.size.height / 2, width: self.size.width, height: self.size.height))
        
        guard let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext() else {
            UIGraphicsEndImageContext()
            return self
        }
        UIGraphicsEndImageContext()
        
        return newImage
    }
}
