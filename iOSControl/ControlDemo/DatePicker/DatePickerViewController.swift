//
//  CreateModelViewController.swift
//  iOSControl
//
//  Created by Thanh on 5/20/21.
//  Copyright © 2021 Than Van Thanh . All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController {
    
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var timeTextField: UITextField!
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var timePicker: UIDatePicker!
    
    let dateLabel = UILabel()
    let timeLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "DatePicker"
        
        setDatePicker()
        setTimePicker()
        
        // khi vào màn hình sẽ gọi hiển thị datePicker luôn cho trường dateTextField
        dateTextField.becomeFirstResponder()
        
        // check nếu chạy trên hệ điều hành iOS 14 trở lên thì sẽ hiển thị DatePicker dạng wheels
        if #available(iOS 14, *) {
            datePicker.preferredDatePickerStyle = UIDatePickerStyle.wheels
            timePicker.preferredDatePickerStyle = UIDatePickerStyle.wheels
        }
    }
    
    func setDatePicker() {
        // set kiểu ngày tháng cho datePicker
        datePicker.datePickerMode = .date
        // gán datePicker cho textField
        dateTextField.inputView = datePicker
        // Set ngày mặc định khi hiển thị
        datePicker.setDate(Date(), animated: true)
        
        //  khởi tạo toolBar, toolBar.sizeToFit là các thành phần nằm trong nó tự dãn theo đúng kích thước width
        let toolBar = UIToolbar()
        dateTextField.inputAccessoryView = toolBar
        toolBar.sizeToFit()
        
        dateLabel.text = "Thanh này là toolbar"
        
        // khai báo các thành phần trong toolBar (button,label)
        let doneButton = UIBarButtonItem(title: "Chọn", style: .plain, target: self, action: #selector(doneDateAction))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: self, action: nil)
        let label = UIBarButtonItem(customView: dateLabel)
        let cancelButton = UIBarButtonItem(title: "Huỷ", style: .plain, target: self, action: #selector(cancelAction))
        
        // set các thành phần vào toolBar
        toolBar.setItems([cancelButton, spaceButton, label, spaceButton, doneButton], animated: false)
        
        // add hành động datepicker
        datePicker.addTarget(self, action: #selector(valueChangeDatePicker), for: UIControlEvents.valueChanged)
    }
    
    @objc func valueChangeDatePicker() {
        dateLabel.text = ConvertHelper.stringFromDate(date: datePicker.date, format: "dd/MM/yyyy")
        dateLabel.sizeToFit()
    }
    
    func setTimePicker() {
        timePicker.datePickerMode = .time
        timeTextField.inputView = timePicker
        
        timePicker.setDate(Date(), animated: true)
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        timeTextField.inputAccessoryView = toolBar
        
        timeLabel.text = "Đây cũng là thanh toolbar"
        
        let doneButton = UIBarButtonItem(title: "Chọn", style: .plain, target: self, action: #selector(doneTimeAction))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: self, action: nil)
        let labelButton = UIBarButtonItem(customView: timeLabel)
        let cancelButton = UIBarButtonItem(title: "Huỷ", style: .plain, target: self, action: #selector(cancelAction))
        
        toolBar.setItems([cancelButton, spaceButton, labelButton, spaceButton, doneButton], animated: false)
        
        timePicker.addTarget(self, action: #selector(valueChangeTimePicker), for: UIControlEvents.valueChanged)
    }
    
    @objc func valueChangeTimePicker() {
        timeLabel.text = ConvertHelper.stringFromDate(date: timePicker.date, format: "HH:mm")
        timeLabel.sizeToFit()
    }
    
    @objc func doneDateAction() {
        dateTextField.text = ConvertHelper.stringFromDate(date: datePicker.date, format: "dd/MM/yyyy")
        timeTextField.becomeFirstResponder()
        
    }
    
    @objc func cancelAction() {
        self.view.endEditing(true)
    }
    
    @objc func doneTimeAction() {
        timeTextField.text = ConvertHelper.stringFromDate(date: timePicker.date, format: "HH:mm")
        self.view.endEditing(true)
    }
    
    
    
}
