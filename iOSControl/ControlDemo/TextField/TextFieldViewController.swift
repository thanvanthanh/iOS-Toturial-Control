//
//  CreateModelViewController.swift
//  iOSControl
//
//  Created by Thanh on 5/20/21.
//  Copyright © 2021 Than Van Thanh . All rights reserved.
//

import UIKit

class TextFieldViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTextField()
    }
    
    func setupTextField() {
        nameTextField.keyboardType = .namePhonePad
        phoneTextField.keyboardType = .phonePad // bàn phím nhập số
        emailTextField.keyboardType = .emailAddress // bàn phím có thêm @ ở ngoài
        
        nameTextField.delegate = self
        phoneTextField.delegate = self
        emailTextField.delegate = self
    }
    
}

extension TextFieldViewController: UITextFieldDelegate {
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // hàm này bắt sự kiện khi gõ vào textfield
        // return true để gõ textfield
        // return false thì không gõ được textfield
        // giá trị truyền vào string trả về chữ cuối cùng mình gõ
        
        // MARK: - Kiểm tra và giới hạn phoneTextField chỉ nhập 10 ký tự
        if textField == phoneTextField,
           let text = textField.text,
           let textRange = Range(range, in: text) {
            let updatedText = text.replacingCharacters(in: textRange,
                                                       with: string)
            print(updatedText)
            // chỉ nhập 10 kí tự
            if updatedText.count > 10 {
                return false
            }
        }
        return true
    }
}







