//
//  CircleView.swift
//  HorizontalTimeline
//
//  Created by Jeff Kereakoglow on 2/25/16.
//  Copyright © 2016 Alexis Digital. All rights reserved.
//

import UIKit

/// Creates a circle with a horizontal line running through the middle of it.
@IBDesignable
final class HorizontalTimelineItem: UIView {
    // Circle
    @IBInspectable var diameter: CGFloat = 50.0
    @IBInspectable var strokeWidth: CGFloat = 2.0
    @IBInspectable var strokeColor: UIColor = .clear
    @IBInspectable var fillColor: UIColor = .clear

    // Line
    @IBInspectable var lineWidth: CGFloat = 2.0
    @IBInspectable var lineColor: UIColor = .clear

    override func draw(_ rect: CGRect) {
        super.draw(rect)

        layer.addSublayer(lineLayer())
        layer.addSublayer(circleLayer())
    }
}

// MARK: - Private helper methods
private extension HorizontalTimelineItem {
    func circleLayer() -> CAShapeLayer {
        let shapeLayer = CAShapeLayer()

        shapeLayer.path = UIBezierPath(
            ovalIn: CGRect(x: 0, y: 0, width: diameter, height: diameter)
            ).cgPath

        shapeLayer.fillColor = fillColor.cgColor
        shapeLayer.strokeColor = strokeColor.cgColor
        shapeLayer.lineWidth = strokeWidth
        shapeLayer.position = CGPoint(
            x: bounds.midX - (diameter / 2.0),
            y: bounds.midY - (diameter / 2.0)
        )

        return shapeLayer
    }

    func lineLayer() -> CAShapeLayer {
        let shapeLayer = CAShapeLayer()
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: bounds.width, y: 0))
        path.close()

        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = lineColor.cgColor
        shapeLayer.lineWidth = lineWidth
        shapeLayer.position = CGPoint(x: 0, y: bounds.height / 2.0)
        
        return shapeLayer
    }
}
