//
//  DrawView.swift
//  Notes
//
//  Created by Ильдар Нигметзянов on 04/08/2019.
//  Copyright © 2019 Learning with Swift. All rights reserved.
//

import UIKit

extension FloatingPoint {
    var degreeToRadians : Self {return self * .pi / 180}
}

class DrawView: UIView {

    override func draw(_ rect: CGRect) {
        guard let currentContext = UIGraphicsGetCurrentContext() else {
            print ("Could not get the context")
            return
        }
        print("draw")
        //setNeedsDisplay()
        drawTick(user: currentContext, isFilled: false)
    }
    
    private func drawTick(user context: CGContext,isFilled:Bool) {
        
        let center = CGPoint(x: 5, y: 12)
        let left = CGPoint(x: 3, y: 3)
        let right = CGPoint(x: 13,y: 6)
       
        let centerPoint = CGPoint(x: 7.5, y: 7.5)
        context.addArc(center: centerPoint, radius: 7, startAngle: CGFloat(0).degreeToRadians, endAngle: CGFloat(360).degreeToRadians, clockwise: true)
        
        
        context.move(to: center)
        context.addLine(to: center)
        context.addLine(to: left)
        context.addLine(to: center)
        context.addLine(to: right)
        context.addLine(to: center)
        context.setLineCap(.square)
        context.setLineWidth(2.0)
        context.setStrokeColor(UIColor.black.cgColor)
        context.strokePath()
    }

}
