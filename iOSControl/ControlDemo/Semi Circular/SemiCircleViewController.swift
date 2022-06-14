//
//  SemiCircleViewController.swift
//  iOSControl
//
//  Created by Thanh - iOS on 14/06/2022.
//  Copyright © 2022 Tào Quỳnh . All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class SemiCircleViewController: UIViewController {

    @IBOutlet weak var semiCircleView: SemiCircleView!
    @IBOutlet weak var processLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        semiCircleView.setupUI(color: .red)
        semiCircleView.setProgress(0)
        // Do any additional setup after loading the view.
    }


    @IBAction func regTap(_ sender: Any) {
        let progress = Int.random(in: 0...100)
        processLabel.text = "\(progress) %"
        semiCircleView.setProgress(Float(progress)/100)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
