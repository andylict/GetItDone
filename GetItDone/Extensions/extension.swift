//
//  extension.swift
//  GetItDone
//
//  Created by Andy Li on 11/16/18.
//  Copyright © 2018 Andy Li. All rights reserved.
//

import UIKit

extension UIColor {
    
    static var blueZero: UIColor { return UIColor.init(rgb: 0x64e4ff) }
    static var blueOne: UIColor { return UIColor.init(rgb: 0x3a7bd5) }
    static var greyZero: UIColor { return UIColor.init(rgb: 0x9b9b9b) }
    static var greyOne: UIColor { return UIColor.init(rgb: 0x424242) }

    
    convenience init(red: Int, green: Int, blue: Int) {
        self.init(red: CGFloat(red)/255.0, green: CGFloat(green)/255.0, blue: CGFloat(blue)/255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(red: (rgb >> 16) & 0xFF, green: (rgb >> 8) & 0xFF, blue: rgb & 0xFF)
    }
}
