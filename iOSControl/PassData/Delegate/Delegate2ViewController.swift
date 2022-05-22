//
//  CreateModelViewController.swift
//  iOSControl
//
//  Created by Thanh on 5/20/21.
//  Copyright © 2021 Than Van Thanh . All rights reserved.
//

import UIKit

// B1: Tạo protocol
protocol MyDelegate {
    //B2: tạo một hàm bắt buộc (required - bắt buộc hoặc optional - không bắt buộc, nếu không có thì hệ thống tự hiểu là bắt buộc
    func backDelegate(text1: String, text2: String)
}

class Delegate2ViewController: UIViewController {

    deinit {
        print("HUy")
    }
    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var secondTextField: UITextField!
    @IBOutlet weak var backButton: UIButton!
    
    // B3: khai báo một biến delegate kiểu dữ liệu là một protocol
    var myDelegate: MyDelegate?
    var delegateFirstVC = DelegateFirstViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func onTab(_ sender: UIButton) {
        
        // B4: truyền dữ liệu
        myDelegate?.backDelegate(text1: firstTextField.text!, text2: secondTextField.text!)
        dismiss(animated: true, completion: nil)
    }
}


