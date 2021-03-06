//
//  CreateModelViewController.swift
//  iOSControl
//
//  Created by Thanh on 5/20/21.
//  Copyright © 2021 Than Van Thanh . All rights reserved.
//

import UIKit

class LongPressGestureViewController: UIViewController {

    let squareView: UIView = {
        let squareView = UIView()
        squareView.translatesAutoresizingMaskIntoConstraints = false
        squareView.backgroundColor = .green
        return squareView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setView()
        navigationItem.title = "Long Press gesture"
    }
    
    func setView(){
        view.addSubview(squareView)
        squareView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        squareView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        squareView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        squareView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(longPress(_:)))
        squareView.addGestureRecognizer(longPressGesture)
    }
    
    @objc func longPress(_ gesture: UILongPressGestureRecognizer){
        print("gesture")
        squareView.backgroundColor = .cyan
    }

}
