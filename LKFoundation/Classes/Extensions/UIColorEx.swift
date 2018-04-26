//
//  UIColorEx.swift
//  GroundPromotionAssistant
//
//  Created by zhulinhua on 2017/12/15.
//  Copyright © 2017年 sangotek. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    public func toImage() -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContextWithOptions(rect.size, true, UIScreen.main.scale)
        self.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
    /// Returns the HEX string from UIColor or NSColor.
    public var hex: String {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        
        self.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        var rgb: Int = (Int)(red * 255) << 16 | (Int)(green * 255) << 8
        rgb = rgb | (Int)(blue * 255) << 0
        
        return String(format: "#%06x", rgb)
    }
    
    /// Create a random color.
    ///
    /// - Parameter alpha: Alpha value.
    /// - Returns: Returns the UIColor or NSColor instance.
    public static func random(alpha: CGFloat = 1.0) -> UIColor {
        let red: Int = Int.random(range: 0...255)
        let green: Int = Int.random(range: 0...255)
        let blue: Int = Int.random(range: 0...255)
        
        return UIColor(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: alpha)
    }
}


