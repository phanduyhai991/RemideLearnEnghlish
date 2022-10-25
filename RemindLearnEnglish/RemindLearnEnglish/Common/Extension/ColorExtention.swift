//
//  ColorExtention.swift
//  RemindLearnEnglish
//
//  Created by HaiPD1 on 10/24/22.
//

import UIKit

extension UIColor {
    static func rgbaColor(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) -> UIColor {
        return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
    }
    
    static func rgbaColorFromCode(code: String, alpha: CGFloat) -> UIColor {
        let scanner = Scanner(string: code)
        var color = CUnsignedInt()
        
        scanner.scanHexInt32(&color)
        
        let red   = CGFloat((color & 0xFF0000) >> 16)
        let green = CGFloat((color & 0x00FF00) >> 8)
        let blue  = CGFloat(color & 0x0000FF)
        return rgbaColor(r: red, g: green, b: blue, a: alpha)
    }
}
