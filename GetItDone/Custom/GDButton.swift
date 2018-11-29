//
//  GDButton.swift
//  GetItDone
//
//  Created by Andy Li on 11/16/18.
//  Copyright © 2018 Andy Li. All rights reserved.
//

import UIKit

class GDButton: UIButton {
    
    var title: String!
    var type: ButtonOptions!
    var radius: CGFloat!
    
    init(title: String = "button text", frame: CGRect = .zero, type: ButtonOptions = .roundedText, radius: CGFloat = 20) {
        super.init(frame: .zero)
        if frame == .zero {
            self.translatesAutoresizingMaskIntoConstraints = false
        }
        
        self.title = title
        self.type = type
        self.radius = radius
        self.phaseTwo()
    }
    
    func phaseTwo() {
        self.setTitle(self.title, for: .normal)
        self.setTitleColor(.greyZero, for: .normal)
        
        self.backgroundColor = .white
        if let titleLabel = self.titleLabel {
            titleLabel.font = UIFont.init(name: "Raleway-v4020-Regular", size: 16)
        }
        switch type {
            case .roundedText:
                self.roundedText()
            case .squareIcon:
                self.squareIcon()
            default:
                break
            }
    }
    
    func roundedText() {
        self.layer.cornerRadius = self.radius
    }
    
    func squareIcon() {
        // this is where we will set custom icons
        if let titleLabel = self.titleLabel {
            titleLabel.font = UIFont.init(name: "Raleway-v4020-Regular", size: 24)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
