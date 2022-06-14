//
//  SemiCircleView.swift
//  iOSControl
//
//  Created by Thanh - iOS on 14/06/2022.
//  Copyright © 2022 Tào Quỳnh . All rights reserved.
//

import UIKit

class SemiCircleView: UIView {

    private var backgroundLayer: CAShapeLayer?
    private var mainLayer: CAShapeLayer?
    
    
    @available(iOS 13.0, *)
    func setupUI(color: UIColor) {
        mainLayer?.removeFromSuperlayer()
        backgroundLayer?.removeFromSuperlayer()
        
        mainLayer = CAShapeLayer()
        backgroundLayer = CAShapeLayer()
        
        let center = CGPoint(x: frame.width/2, y: frame.height/2)
        let circularPath = UIBezierPath(arcCenter: center,
                                        radius: frame.height/2,
                                        startAngle: CGFloat.pi * 3/4,
                                        endAngle: CGFloat.pi * 13/6,
                                        clockwise: true)
        
        mainLayer?.path = circularPath.cgPath
        backgroundLayer?.path = circularPath.cgPath
        setupSubLayer(backgroundLayer, color: UIColor.separator, progress: 1)
        setupSubLayer(mainLayer, color: color, progress: 0)
        
    }
    
    private func setupSubLayer(_ shapeLayer: CAShapeLayer?, color: UIColor, progress: CGFloat) {
        shapeLayer?.fillColor = UIColor.clear.cgColor
        shapeLayer?.strokeEnd = progress
        shapeLayer?.strokeColor = color.cgColor
        shapeLayer?.lineWidth = 12
        shapeLayer?.lineCap = "round"
        if let sub = shapeLayer {
            layer.addSublayer(sub)
        }
    }
    
    func setProgress(_ progress: Float) {
        UIView.animate(withDuration: 0.3) {
            self.mainLayer?.strokeEnd = CGFloat(progress)
        }
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
