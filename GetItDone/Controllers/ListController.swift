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
    }
    
    func addItemToList(text: String) {
        print("text in textField is: \(text)")
    }
    
    // pass parameter to listController
    let header = GDHeaderView(title: "Stuff to get done", subtitle: "4 Left")
    let popup = GDNewItemPopup() // default value .zero
    
    var keyboardHeight: CGFloat = 333
    
    override func viewDidLoad() { // render view
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(header)
        header.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        header.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        header.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        // not use bottom anchor, only specify height
        header.heightAnchor.constraint(equalToConstant: 120).isActive = true
        
        view.addSubview(popup)
        popup.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        popup.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        popup.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        popup.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        header.delegate = self
        
        popup.textField.delegate = self
        popup.delegate = self
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
    
    /*
     implement UITextField delegate
     */
    
}

extension ListController: UITextFieldDelegate {
    // when editing the textfield, will run this method
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // print("textfield did begin editing")
        
        // animate the move
        // animateView(view: self.popup, transform: CGAffineTransform(translationX: 0, y: -self.keyboardHeight))
        // 或者把animateView写在extension里 直接从view对象调用
        self.popup.animateView(transform: CGAffineTransform(translationX: 0, y: -self.keyboardHeight), duration: 0.5)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        // animateView(view: self.popup, transform: CGAffineTransform(translationX: 0, y: 0))
        self.popup.animateView(transform: CGAffineTransform(translationX: 0, y: 0), duration: 0.6)
    }
    
    func animateView(view: UIView, transform: CGAffineTransform) {
        UIView.animate(withDuration: 0.25, delay: 0, usingSpringWithDamping: 0.85, initialSpringVelocity: 2, options: .curveEaseIn, animations: {
            view.transform = transform
        }, completion: nil)
    }
    
    
}
