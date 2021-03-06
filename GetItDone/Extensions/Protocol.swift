//
//  Protocol.swift
//  GetItDone
//
//  Created by Andy Li on 11/17/18.
//  Copyright © 2018 Andy Li. All rights reserved.
//

import Foundation

protocol GDHeaderDelegate {
    func openAddItemPopup()
}

protocol GDNewItemPopupDelegate {
    func addItemToList(text: String)
}

protocol GDListCellDelegate {
    // func toggleToDo(id: Int, status: Bool)
    // func toggleToDo(toDo: ToDo)
    func toggleToDo()
}
