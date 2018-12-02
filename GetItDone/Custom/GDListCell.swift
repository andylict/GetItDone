//
//  GDListCell.swift
//  GetItDone
//
//  Created by Andy Li on 11/29/18.
//  Copyright © 2018 Andy Li. All rights reserved.
//

import UIKit

class GDListCell: UITableViewCell {
    
    var toDo: ToDo? {
        didSet {
            if let toDo = toDo {
                print(toDo.title)
                
                self.box.finished = toDo.status
                self.textField.text = toDo.title
                // self.box.id = toDo.id
            }
        }
    }
    
    // let titleLabel = GDLabel(color: .greyZero, size: 14)
    let textField = GDTextField(placeholder: "To Do", radius: 0, inset: 14)
    let view: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let box = GDCheckBox()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        // self.backgroundColor = .white
        // self.textLabel?.textColor = .greyZero
        backgroundColor = .clear
        
        addSubview(view)
        view.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        view.topAnchor.constraint(equalTo: topAnchor, constant: 3).isActive = true
        view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -3).isActive = true
        view.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        view.backgroundColor = .white
        
        view.addSubview(textField)
        textField.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        textField.topAnchor.constraint(equalTo: topAnchor, constant: 3).isActive = true
        textField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -3).isActive = true
        textField.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        addSubview(box)
        box.rightAnchor.constraint(equalTo: rightAnchor, constant: -14).isActive = true
        box.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        box.widthAnchor.constraint(equalToConstant: 22).isActive = true
        box.heightAnchor.constraint(equalTo: box.widthAnchor).isActive = true
        
        box.addTarget(self, action: #selector(self.toggleStatus), for: .touchUpInside)
    }
    
    // toggle box
    var delegete: GDListCellDelegate?
    
    @objc func toggleStatus() {
        if let delegete = self.delegete, let toDo = self.toDo {
//            let newToDo = toDo(id: toDo.id, title: textField.text!, status: !toDo.status)
//            delegete.toggleToDo(toDo: newToDo)
            CoreDataManager.shared.deleteToDo(id: toDo.id)
            CoreDataManager.shared.createToDo(id: toDo.id, title: textField.text!, status: !toDo.status)
            delegete.toggleToDo()
        }
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
