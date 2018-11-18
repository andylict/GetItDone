//
//  OptionSet.swift
//  GetItDone
//
//  Created by Andy Li on 11/17/18.
//  Copyright © 2018 Andy Li. All rights reserved.
//

import Foundation

// diffent button options
struct ButtonOptions: OptionSet {
    let rawValue: Int
    static let roundedText = ButtonOptions(rawValue: 1 << 0)
    static let squareIcon = ButtonOptions(rawValue: 1 << 1)
    static let squareText = ButtonOptions(rawValue: 1 << 2)
}
