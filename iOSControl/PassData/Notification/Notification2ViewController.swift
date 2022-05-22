//
//  CreateModelViewController.swift
//  iOSControl
//
//  Created by Thanh on 5/20/21.
//  Copyright © 2021 Than Van Thanh . All rights reserved.
//

import UIKit

class Notification2ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var feelLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Noti 2"
        // đăng kí nhận thông báo khi khởi tạo màn hình
        NotificationCenter.default.addObserver(self, selector: #selector(notification(_:)), name: .notificationNamePost, object: nil)
    }

    @objc func notification(_ notification: Notification){
        // B3: ép kiểu biến nhận thông báo giống với kiểu đã được push
        if let post = notification.object as? Post{
            
            titleLabel.text = post.title
            feelLabel.text = post.feel
            // push thông báo
        }
        
        print("Notification2ViewController")
    }
    
    @IBAction func onBackPress(_ sender: UIButton) {
        navigationController?.pushViewController(Notification3ViewController(), animated: true)
    }
}
