//
//  CreateModelViewController.swift
//  iOSControl
//
//  Created by Thanh on 5/20/21.
//  Copyright © 2021 Than Van Thanh . All rights reserved.
//

import UIKit

class DelegateFirstViewController: UIViewController {

    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    
    var text: String?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @IBAction func onPress(_ sender: UIButton) {
        let delegate2 = Delegate2ViewController()
        // B5: sử dụng delegate
        delegate2.myDelegate = self
        present(delegate2, animated: true, completion: nil)
    }
    
}

// B6: viết extension cho delegate
extension DelegateFirstViewController: MyDelegate{
    func backDelegate(text1: String, text2: String) {
        firstLabel.text = text1
        secondLabel.text = text2
    }
}
