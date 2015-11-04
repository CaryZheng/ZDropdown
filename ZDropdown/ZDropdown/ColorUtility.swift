//
//  ColorUtility.swift
//  ZDropdown
//
//  Created by CaryZheng on 7/9/15.
//  Copyright (c) 2015 CaryZheng. All rights reserved.
//

import UIKit

class ColorUtility {
    
    static func colorize (hex: Int, alpha: Double) -> UIColor {
        
        let red = Double((hex & 0xFF0000) >> 16) / 255.0
        let green = Double((hex & 0xFF00) >> 8) / 255.0
        let blue = Double((hex & 0xFF)) / 255.0
        let color: UIColor = UIColor( red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha:CGFloat(alpha) )
        return color
    }
    
    static func colorize (hex: Int) -> UIColor {
        
        return colorize(hex, alpha: 1.0)
    }
}
