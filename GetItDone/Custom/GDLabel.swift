//
//  GDLabel.swift
//  GetItDone
//
//  Created by Andy Li on 11/16/18.
//  Copyright © 2018 Andy Li. All rights reserved.
//

import UIKit

class GDLabel: UILabel {
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(title: String = "default text", color: UIColor = .white, size: CGFloat = 16, frame: CGRect = .zero, textAlignment: NSTextAlignment = .left) {
        super.init(frame: .zero)
        if frame == .zero {
            self.translatesAutoresizingMaskIntoConstraints = false
        }
        
        // apply the change
        self.text = title
        self.textColor = color
//        self.font = UIFont.systemFont(ofSize: size)
        
        // 使用custom字体
        self.font = UIFont.init(name: "Raleway-v4020-Regular", size: size)
        self.textAlignment = textAlignment
    }
}
