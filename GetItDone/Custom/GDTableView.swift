//
//  GDTableView.swift
//  GetItDone
//
//  Created by Andy Li on 11/29/18.
//  Copyright © 2018 Andy Li. All rights reserved.
//

import UIKit

class GDTableView: UITableView {
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        checkAutoLayout()
        backgroundColor = .clear
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
