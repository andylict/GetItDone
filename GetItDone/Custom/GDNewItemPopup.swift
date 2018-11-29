//
//  NewItemPopup.swift
//  GetItDone
//
//  Created by Andy Li on 11/18/18.
//  Copyright © 2018 Andy Li. All rights reserved.
//

import UIKit

class GDNewItemPopup: GDGradient {
    /*
    // inheritance from GDGradient, no need to write duplicate code
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
    }
    */
    
    // create some buttons
    let cancel = GDButton(title: "  cancel  ", type: .roundedText, radius: 4)
    let add = GDButton(title: "  add  ", type: .roundedText, radius: 4)
    let textField = GDTextField(placeholder: "go buy Ikea frames", inset: 4)
    var delegate: GDNewItemPopupDelegate?
    
    @objc func handleCancel() {
        // print("trying to handle cancel")
        textField.resignFirstResponder()
        // only keyboard disappear, the textField is not drop, need to implement textFieldDidEndEditing() in ListController
    }
    
    @objc func handleAdd() {
        // print("trying to handle add")
        if let delegate = self.delegate, let textFieldText = self.textField.text { // also check the textFieldText do have value, not nil
            delegate.addItemToList(text: textFieldText)
        }
    }
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        
        let inset: CGFloat = 12
        
        self.layer.cornerRadius = 14
        
        addSubview(cancel)
        cancel.leftAnchor.constraint(equalTo: leftAnchor, constant: inset).isActive = true
        cancel.topAnchor.constraint(equalTo: topAnchor, constant: inset).isActive = true
        cancel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        addSubview(add)
        add.rightAnchor.constraint(equalTo: rightAnchor, constant: inset * -1).isActive = true
        add.topAnchor.constraint(equalTo: topAnchor, constant: inset).isActive = true
        add.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        addSubview(textField)
        textField.leftAnchor.constraint(equalTo: leftAnchor, constant: inset).isActive = true
        textField.rightAnchor.constraint(equalTo: rightAnchor, constant: inset * -1).isActive = true
        textField.topAnchor.constraint(equalTo: add.bottomAnchor, constant: 8).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 28).isActive = true
        
        cancel.addTarget(self, action: #selector(self.handleCancel), for: .touchUpInside)
        add.addTarget(self, action: #selector(self.handleAdd), for: .touchUpInside)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
