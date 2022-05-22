//
//  CreateModelViewController.swift
//  iOSControl
//
//  Created by Thanh on 5/20/21.
//  Copyright © 2021 Than Van Thanh . All rights reserved.
//

import UIKit

class Notification1ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var feelLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Noti 1"
        // đăng kí thông báo khi khởi tạo màn hình
        NotificationCenter.default.addObserver(self, selector: #selector(notification(_:)), name: .noticicationNameBlog, object: nil)
    }
    
    @objc func notification(_ notification: Notification){
        if let post = notification.object as? Post{
            titleLabel.text = post.title
            feelLabel.text = post.feel
        }
        print("Notification1ViewController")
    }

    @IBAction func onPress(_ sender: UIButton) {
        navigationController?.pushViewController(Notification2ViewController(), animated: true)
    }
    
}
