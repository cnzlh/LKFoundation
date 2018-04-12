//
//  Common.swift
//  RouterAssistant
//
//  Created by zhulinhua on 2017/9/19.
//  Copyright © 2017年 sangotek. All rights reserved.
//

import Foundation
import UIKit

// 屏幕宽度
let kScreenW = UIScreen.main.bounds.width
// 屏幕高度
let kScreenH = UIScreen.main.bounds.height

//MARK: -颜色方法
func RGBA (_ r:CGFloat,g:CGFloat,b:CGFloat,a:CGFloat)-> UIColor{
    return UIColor (red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
}

//MARK: 不透明颜色
func RGBColor (_ r:CGFloat,g:CGFloat,b:CGFloat)-> UIColor{
    return UIColor (red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1)
}

// MARK:- 自定义打印方法
func DLog<T>(_ message : T, file : String = #file, funcName : String = #function, lineNum : Int = #line) {
    
    #if DEBUG
        
        let fileName = (file as NSString).lastPathComponent
        
        print("\(fileName).\(funcName)\n[Line: \(lineNum)] \(message)")
        
    #endif
}
