//
//  GDGradient.swift
//  GetItDone
//
//  Created by Andy Li on 11/16/18.
//  Copyright © 2018 Andy Li. All rights reserved.
//

import UIKit

class GDGradient: UIView {
    
//    var colors: [CGColor] = [
//        UIColor.init(red: 100, green: 228, blue: 255).cgColor,
//        UIColor.init(red: 58, green: 123, blue: 213).cgColor
//    ]

    var hexColors: [CGColor] = [
//        UIColor.init(rgb: 0x64E4FF).cgColor,
//        UIColor.init(rgb: 0x3A7BD5).cgColor
        UIColor.blueZero.cgColor,
        UIColor.blueOne.cgColor
    ]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let layer = self.layer as? CAGradientLayer {
            // layer.colors = [UIColor.blue.cgColor, UIColor.gray.cgColor]
            // layer.colors = self.colors
            layer.colors = self.hexColors
            layer.locations = [0.0, 1.2]
            
        }
    }
    
    // override layer
    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
