//
//  ViewController.swift
//  GetItDone
//
//  Created by Andy Li on 11/15/18.
//  Copyright © 2018 Andy Li. All rights reserved.
//

import UIKit

class WelcomeController: UIViewController {

    let bg: UIView = {
        let view = GDGradient()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = .cyan
        view.layer.cornerRadius = 6
        return view
    }()
    
    let titleLabel = GDLabel(title: "GET IT DONE", size: 24, textAlignment: .center)
    let infoLabel = GDLabel(title: "WELCOME.GET IT DONE IS A TO DO LIST.\nA REALLLY DOPE TO-DO-LIST.", size: 14, textAlignment: .center)
    let copyright = GDLabel(title: "© 2018 | andy.li", color: .greyZero, size: 14, textAlignment: .center)
    
    let nextButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
//        titleLable.text = "GET IT DONE"
//        titleLable.translatesAutoresizingMaskIntoConstraints = false
        
        
        view.addSubview(bg)
        bg.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        bg.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        bg.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
        bg.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        
        bg.addSubview(titleLabel)
        titleLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: bg.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: bg.topAnchor, constant: 60).isActive = true
        
        bg.addSubview(infoLabel)
        infoLabel.numberOfLines = 2
        infoLabel.centerXAnchor.constraint(equalTo: bg.centerXAnchor).isActive = true
        infoLabel.centerYAnchor.constraint(equalTo: bg.centerYAnchor).isActive = true
        infoLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        infoLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        bg.addSubview(nextButton)
        
        // copyright放在最下边 不在中间的界面上 不是bg.addSubview
        view.addSubview(copyright)
        copyright.widthAnchor.constraint(equalToConstant: 200).isActive = true
        copyright.heightAnchor.constraint(equalToConstant: 40).isActive = true
        copyright.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        copyright.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
    }
}

