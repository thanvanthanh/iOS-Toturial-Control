//
//  CreateModelViewController.swift
//  iOSControl
//
//  Created by Thanh on 5/20/21.
//  Copyright © 2021 Than Van Thanh . All rights reserved.
//

import UIKit

class ButtonViewController: UIViewController {
    
    @IBOutlet weak var thirdView: UIView!
    
    let searchButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Search", for: .normal)
        button.setTitle("Searching", for: .highlighted) // chế độ hightlighted
        button.contentHorizontalAlignment = .left
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0) // tạo padding
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.setTitleColor(UIColor.white, for: .normal)
        button.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 0.2), for: .highlighted) // chế độ hightlighted
        button.backgroundColor = UIColor.brown
        return button
    }()
    
    let nextButton: UIButton = {
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Next", for: .normal)
        button.contentHorizontalAlignment = .center
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor.brown
        button.setImage(UIImage(named: "next"), for: .normal )
        button.semanticContentAttribute = UIApplication.shared
            .userInterfaceLayoutDirection == .rightToLeft ? .forceLeftToRight : .forceRightToLeft // check hướng layout để đặt ảnh so với title
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        
        return button
    }()
    
    let previousButton: UIButton = {
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Previous", for: .normal)
        button.contentHorizontalAlignment = .center
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor.brown
        button.setImage(UIImage(named: "previous"), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Button"
        setupButton()
    }
    
    func setupButton() {
        // addSubview
        thirdView.addSubview(searchButton)
        thirdView.addSubview(nextButton)
        thirdView.addSubview(previousButton)
        
        // searchButton
        searchButton.topAnchor.constraint(equalTo: thirdView.topAnchor, constant: 16).isActive = true
        searchButton.leftAnchor.constraint(equalTo: thirdView.leftAnchor, constant: 16).isActive = true
        searchButton.rightAnchor.constraint(equalTo: thirdView.rightAnchor, constant: -16).isActive = true
        searchButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        searchButton.addTarget(self, action: #selector(searchPress), for: .touchUpInside)
        
        // previousButton
        previousButton.topAnchor.constraint(equalTo: searchButton.bottomAnchor, constant: 8).isActive = true
        previousButton.leftAnchor.constraint(equalTo: thirdView.leftAnchor, constant: 16).isActive = true
        previousButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        previousButton.widthAnchor.constraint(equalTo: nextButton.widthAnchor).isActive = true
        
        // nextButton
        nextButton.topAnchor.constraint(equalTo: searchButton.bottomAnchor, constant: 8).isActive = true
        nextButton.leftAnchor.constraint(equalTo: previousButton.rightAnchor, constant: 8).isActive = true
        nextButton.rightAnchor.constraint(equalTo: thirdView.rightAnchor, constant: -16).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
        // action cho button
        previousButton.addTarget(self, action: #selector(searchPress), for: .touchUpInside)
        nextButton.addTarget(self, action: #selector(searchPress), for: .touchUpInside)
    }
    
    //    @IBAction func
    @objc func searchPress() {
        print("searchPress")
    }
    
    @IBAction func signInDidPress(_ sender: UIButton) {
        
        print("Sign In")
    }
    
    
}
