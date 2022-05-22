//
//  CreateModelViewController.swift
//  iOSControl
//
//  Created by Thanh on 5/20/21.
//  Copyright © 2021 Than Van Thanh . All rights reserved.
//

import UIKit

class StepperViewController: UIViewController {

    @IBOutlet weak var stepper: UIStepper!
    override func viewDidLoad() {
        super.viewDidLoad()

        stepper.minimumValue = 0
        stepper.maximumValue = 100
        stepper.stepValue = 10
        
        stepper.addTarget(self, action: #selector(changeAction), for: .valueChanged)
    }
    
    @objc func changeAction() {
        title = String(stepper.value)
    }

}
