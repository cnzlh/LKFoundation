//
//  NumberExtension.swift
//  LKFoundation
//
//  Created by zhulinhua on 2018/4/25.
//

import Foundation


public extension Int {
    public static func random(lower: Int = 0, _ upper: Int = Int.max) -> Int {
        return lower + Int(arc4random_uniform(UInt32(upper - lower + 1)))
    }
    
    public static func random(range: ClosedRange<Int>) -> Int {
        return random(lower: range.lowerBound, range.upperBound)
    }
}
