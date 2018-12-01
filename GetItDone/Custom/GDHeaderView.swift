//
//  GDHeaderView.swift
//  GetItDone
//
//  Created by Andy Li on 11/17/18.
//  Copyright © 2018 Andy Li. All rights reserved.
//

import UIKit

class GDHeaderView: UIView {
    
    let bg = GDGradient()
    let titleLabel = GDLabel(size: 14)
    let subtitleLabel = GDLabel(size: 24)
    let addButton = GDButton(type: .squareIcon)
    var delegate: GDHeaderDelegate?
    var itmesLeftCounter: Int = 0 {
        didSet {
            self.subtitleLabel.text = "\(itmesLeftCounter) Left"
        }
    }
    
    init(frame: CGRect = .zero, title: String = "Header Title", subtitle: String = "Header Subtitle") {
        super.init(frame: frame)
        if frame == .zero {
            translatesAutoresizingMaskIntoConstraints = false
        }
        // apply titles to labels
        self.titleLabel.text = title
        self.subtitleLabel.text = subtitle
        self.setupLayout()
    }
    
    func setupLayout() {
        addSubview(bg)
        bg.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        bg.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        bg.topAnchor.constraint(equalTo: topAnchor).isActive = true
        bg.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        
        titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 12).isActive = true // constant是把label往下移动一部分
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20 + 16).isActive = true // 20是主界面的left，8是header额外的增加量
        titleLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
        subtitleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20 + 16).isActive = true
        subtitleLabel.rightAnchor.constraint(equalTo: centerXAnchor, constant: 50).isActive = true
        
        addSubview(addButton)
        addButton.bottomAnchor.constraint(equalTo: subtitleLabel.bottomAnchor).isActive = true
        addButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -20 - 16 - 14).isActive = true
        addButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
        addButton.widthAnchor.constraint(equalTo: addButton.heightAnchor, multiplier: 1).isActive = true
        
        addButton.addTarget(delegate, action: #selector(self.handleAddButton), for: .touchUpInside)
    }
    
    @objc func handleAddButton() {
        // perform add item
        if let delegate = self.delegate { // because delegate is ?, may not exist
            delegate.openAddItemPopup() // call method in ListController
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
