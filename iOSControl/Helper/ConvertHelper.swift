//
//  CreateModelViewController.swift
//  iOSControl
//
//  Created by Thanh on 5/20/21.
//  Copyright © 2021 Than Van Thanh . All rights reserved.
//

import Foundation

class ConvertHelper {
    static func stringFromDate(date: Date, format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        let string = formatter.string(from: date)
        return string
    }
}
