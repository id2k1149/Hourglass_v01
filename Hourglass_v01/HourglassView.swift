//
//  HourglassView.swift
//  Hourglass_v01
//
//  Created by Max Franz Immelmann on 4/3/23.
//

import Foundation
import UIKit

class HourglassView: UIView {
    
    // properties
    var elapsedTime: TimeInterval = 0.0 {
        didSet {
            setNeedsDisplay()
        }
    }
    var totalDuration: TimeInterval = 60.0
    
    // constants
    let borderWidth: CGFloat = 2.0
    let sandColor: UIColor = .brown
    let borderColor: UIColor = .black
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let context = UIGraphicsGetCurrentContext()!
        context.setLineWidth(borderWidth)
        context.setStrokeColor(borderColor.cgColor)
        context.strokePath()
        
        let halfWidth = rect.width / 2.0
        let halfHeight = rect.height / 2.0
        let sandHeight = halfHeight * CGFloat(elapsedTime / totalDuration)
        
        context.move(to: CGPoint(x: 0, y: 0))
        context.addLine(to: CGPoint(x: halfWidth - borderWidth, y: 0))
        context.addLine(to: CGPoint(x: halfWidth - borderWidth, y: halfHeight - borderWidth))
        context.addLine(to: CGPoint(x: 0, y: halfHeight - borderWidth))
        context.closePath()
        context.setFillColor(sandColor.cgColor)
        context.fillPath()
        
        context.move(to: CGPoint(x: rect.width, y: 0))
        context.addLine(to: CGPoint(x: halfWidth + borderWidth, y: 0))
        context.addLine(to: CGPoint(x: halfWidth + borderWidth, y: halfHeight - borderWidth))
        context.addLine(to: CGPoint(x: rect.width, y: halfHeight - borderWidth))
        context.closePath()
        context.setFillColor(sandColor.cgColor)
        context.fillPath()
        
        context.move(to: CGPoint(x: 0, y: halfHeight + borderWidth))
        context.addLine(to: CGPoint(x: halfWidth - borderWidth, y: halfHeight + borderWidth))
        context.addLine(to: CGPoint(x: halfWidth - borderWidth, y: rect.height))
        context.addLine(to: CGPoint(x: 0, y: rect.height))
        context.closePath()
        context.setFillColor(sandColor.cgColor)
        context.fillPath()
        
        context.move(to: CGPoint(x: rect.width, y: halfHeight + borderWidth))
        context.addLine(to: CGPoint(x: halfWidth + borderWidth, y: halfHeight + borderWidth))
        context.addLine(to: CGPoint(x: halfWidth + borderWidth, y: rect.height))
        context.addLine(to: CGPoint(x: rect.width, y: rect.height))
        context.closePath()
        context.setFillColor(sandColor.cgColor)
        context.fillPath()
    }
}

