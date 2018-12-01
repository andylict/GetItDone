//
//  ListController.swift
//  GetItDone
//
//  Created by Andy Li on 11/16/18.
//  Copyright © 2018 Andy Li. All rights reserved.
//

import UIKit

class ListController: UIViewController, GDHeaderDelegate, GDNewItemPopupDelegate {
    
    func openAddItemPopup() {
        print("trying to open add item popup view")
        popup.animatePopup()
    }
    
    func addItemToList(text: String) {
        if notInList(text: text) {
            print("text in textField is: \(text)")
            let newItem = ToDo(id: self.listData.count, title: text, status: false)
            self.listData.append(newItem)
            self.listTable.reloadData()
            self.updateHeaderCounter()
            // clear textField
            self.popup.textField.text = ""
            self.popup.animatePopup()
        }
    }
    
    func notInList(text: String) -> Bool {
        var notInList = true
        self.listData.forEach { (toDo) in
            if toDo.title == text {
                notInList = false
                return
            }
        }
        return notInList
    }
    
    // pass parameter to listController
    let header = GDHeaderView(title: "Stuff to get done", subtitle: "4 Left")
    let popup = GDNewItemPopup() // default value .zero
    
    var keyboardHeight: CGFloat = 333
    
    let bg: UIView = { // use same bg as welcome controller
        let view = GDGradient()
        view.layer.cornerRadius = 16
        return view
    }()
    
    let listTable = GDTableView()
    let CELL_ID = "cell_id"
    var listData: [ToDo] = [ToDo]()
    
    let tbInset: CGFloat = 16 // inset for list table
    var bgBottom: NSLayoutConstraint! // make the bg bottom constraint global variable
    
    override func viewDidLoad() { // render view
        super.viewDidLoad()
        
        listData = [
            // ToDo(id: 0, title: "first item", status: false),
            // ToDo(id: 1, title: "Hey dude", status: true),
            // ToDo(id: 2, title: "It's lit fam", status: true)
        ]
        self.updateHeaderCounter()
        
        view.backgroundColor = .white
        
        view.addSubview(header)
        header.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        header.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        header.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        // not use bottom anchor, only specify height
        header.heightAnchor.constraint(equalToConstant: 120).isActive = true
        
        view.addSubview(bg)
        bg.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        bg.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 20).isActive = true
        bgBottom = bg.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100)
        bgBottom.isActive = true
        bg.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        
        view.addSubview(listTable)
        listTable.leftAnchor.constraint(equalTo: bg.leftAnchor, constant: tbInset).isActive = true
        listTable.topAnchor.constraint(equalTo: bg.topAnchor, constant: tbInset).isActive = true
        listTable.bottomAnchor.constraint(equalTo: bg.bottomAnchor, constant: tbInset * -1).isActive = true
        listTable.rightAnchor.constraint(equalTo: bg.rightAnchor, constant: tbInset * -1).isActive = true
        
        view.addSubview(popup)
        popup.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        popup.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        popup.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        popup.heightAnchor.constraint(equalToConstant: 80).isActive = true
        openAddItemPopup()
        
        header.delegate = self
        
        popup.textField.delegate = self
        popup.delegate = self
        
        listTable.delegate = self
        listTable.dataSource = self
        listTable.register(GDListCell.self, forCellReuseIdentifier: CELL_ID)
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification: )), name: NSNotification.Name.UIKeyboardDidShow, object: nil)
    }
    
    @objc func keyboardWillShow(notification: Notification) {
        let keyboardSize = (notification.userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue.size
        self.keyboardHeight = keyboardSize.height
        // print(self.keyboardHeight)
        
        // moved animate in the delegate
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func updateHeaderCounter() {
        header.itmesLeftCounter = 0
        self.listData.forEach { (toDo) in
            if !toDo.status {
                header.itmesLeftCounter += 1
            }
        }
    }
}

extension ListController: UITextFieldDelegate {
    // when editing the textfield, will run this method
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // print("textfield did begin editing")
        
        var heightToDisplayKeyboard = -keyboardHeight - 20
        
        // when edit the main list, do not show the popup
        if textField == popup.textField {
            // animateView(view: self.popup, transform: CGAffineTransform(translationX: 0, y: -self.keyboardHeight))
            // 或者把animateView写在extension里 直接从view对象调用
            self.popup.animateView(transform: CGAffineTransform(translationX: 0, y: -self.keyboardHeight), duration: 0.5)
            heightToDisplayKeyboard -= 80
        }
        
        self.bgBottom.constant = heightToDisplayKeyboard
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.bgBottom.constant = -100
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
        if textField == popup.textField {
            // animateView(view: self.popup, transform: CGAffineTransform(translationX: 0, y: 0))
            self.popup.animateView(transform: CGAffineTransform(translationX: 0, y: 0), duration: 0.6)
        }
    }
    
    func animateView(view: UIView, transform: CGAffineTransform) {
        UIView.animate(withDuration: 0.25, delay: 0, usingSpringWithDamping: 0.85, initialSpringVelocity: 2, options: .curveEaseIn, animations: {
            view.transform = transform
        }, completion: nil)
    }
    
    // make keyboard disappear when hit return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension ListController: UITableViewDelegate, UITableViewDataSource, GDListCellDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // unfinished => section 0; finished => section 1
        var count = 0
        self.listData.forEach { (toDo) in
            if section == 0 && !toDo.status {
                count += 1
            } else if section == 1 && toDo.status {
                count += 1
            }
        }
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CELL_ID, for: indexPath) as! GDListCell
        
        cell.delegete = self // when event happens in GDCheckbox, it will run this func
        cell.textField.delegate = self
        // display correct item in each section
        var itemsForSection: [ToDo] = []
        self.listData.forEach { (toDo) in
            if indexPath.section == 0 && !toDo.status {
                itemsForSection.append(toDo)
            } else if indexPath.section == 1 && toDo.status {
                itemsForSection.append(toDo)
            }
        }
        cell.toDo = itemsForSection[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // declare the height for each row
        return 42
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    // adding title for each section
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "To Do"
        }
        return "Done"
    }
    
    // changing the view for header
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let titleForHeader = GDLabel(color: .white, size: 20, frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 44))
        if section == 0 {
            titleForHeader.text = "To Do"
        } else {
            titleForHeader.text = "Done"
        }
        return titleForHeader
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 38
    }
    
    func toggleToDo(toDo udpatedToDo: ToDo) {
        print("trying to toggle todo in DB, id: \(udpatedToDo.id), \(udpatedToDo.status)")
        // toggle data
        let newListData = self.listData.map { (oldToDo) -> ToDo in
            if oldToDo.id == udpatedToDo.id {
                var newToDo = oldToDo // get new object
                newToDo.title = udpatedToDo.title
                newToDo.status = udpatedToDo.status
                return newToDo
            }
            return oldToDo
        }
        self.listData = newListData
        self.listTable.reloadData()
        self.updateHeaderCounter()
    }
}
