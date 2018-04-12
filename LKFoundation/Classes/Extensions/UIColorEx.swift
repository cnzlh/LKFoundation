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
    func toImage() -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContextWithOptions(rect.size, true, UIScreen.main.scale)
        self.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}
