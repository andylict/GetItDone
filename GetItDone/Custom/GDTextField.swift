//
//  GDTextField.swift
//  GetItDone
//
//  Created by Andy Li on 11/28/18.
//  Copyright © 2018 Andy Li. All rights reserved.
//

import UIKit

class GDTextField: UITextField {
    
    var insets: UIEdgeInsets!
    
    init(frame: CGRect = .zero, placeholder: String = "placeholder", radius: CGFloat = 4, inset: CGFloat = 0) {
        super.init(frame: frame)
        checkAutoLayout()
        
        self.placeholder = placeholder
        // set background color
        self.backgroundColor = UIColor.white
        self.layer.cornerRadius = radius
        self.insets = UIEdgeInsets(top: 0, left: inset, bottom: 0, right: 0)
        self.textColor = .greyZero
    }
    
    // push text away from the left edge
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, self.insets)
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, self.insets)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, self.insets)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
