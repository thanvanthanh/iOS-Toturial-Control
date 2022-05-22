//
//  CreateModelViewController.swift
//  iOSControl
//
//  Created by Thanh on 5/20/21.
//  Copyright © 2021 Than Van Thanh . All rights reserved.
//

import UIKit

class RotateGestureViewController: UIViewController {

    let squareView: UIView = {
        let squareView = UIView()
        squareView.translatesAutoresizingMaskIntoConstraints = false
        squareView.backgroundColor = .green
        return squareView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setView()
        navigationItem.title = "Rotate gesture"
    }
    
    func setView(){
        view.addSubview(squareView)
        squareView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        squareView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        squareView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        squareView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        let rotateGesture = UIRotationGestureRecognizer(target: self, action: #selector(rotate(_:)))
        squareView.addGestureRecognizer(rotateGesture)
    }
    
    @objc func rotate(_ gesture: UIRotationGestureRecognizer){
        if gesture.state == .ended{
            squareView.transform = CGAffineTransform.identity
        }else{
            squareView.transform = CGAffineTransform.init(rotationAngle: gesture.rotation)
        }
    }
}
