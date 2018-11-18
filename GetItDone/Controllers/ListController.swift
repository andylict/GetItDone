//
//  ListController.swift
//  GetItDone
//
//  Created by Andy Li on 11/16/18.
//  Copyright © 2018 Andy Li. All rights reserved.
//

import UIKit

class ListController: UIViewController, GDHeaderDelegate {
    
    func addItem() {
        print("trying to add item for header")
    }
    
    // pass parameter to listController
    let header = GDHeaderView(title: "Stuff to get done", subtitle: "4 Left")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(header)
        header.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        header.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        header.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        // not use bottom anchor, only specify height
        header.heightAnchor.constraint(equalToConstant: 120).isActive = true
        
        header.delegate = self
    }
}
