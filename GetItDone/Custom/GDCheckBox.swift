//
//  GDCheckBox.swift
//  GetItDone
//
//  Created by Andy Li on 11/29/18.
//  Copyright © 2018 Andy Li. All rights reserved.
//

import UIKit

class GDCheckBox: UIButton {
    
    
    var id: Int?
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        
        // setup border
        layer.borderWidth = 1
        layer.borderColor = UIColor.greyZero.cgColor
        
        
    }
    
    // change the checkbox background color based on todo.status value
    var finished: Bool? {
        didSet {
            if let finished = finished {
                // animate the toggle
                UIView.animate(withDuration: 0.2, animations: {
                    if finished {
                        self.backgroundColor = .green
                        self.setImage(UIImage(named: "done-icon"), for: .normal)  // add icon
                    } else {
                        self.backgroundColor = .clear
                        self.setImage(UIImage(), for: .normal)
                    }
                })
                
            }
        }
    }
    

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
