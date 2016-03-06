//
//  CircleView.swift
//  HorizontalTimeline
//
//  Created by Jeff Kereakoglow on 2/25/16.
//  Copyright © 2016 Alexis Digital. All rights reserved.
//

import UIKit

/// Creates a circle with a horizontal line running through the middle of it.
@IBDesignable class HorizontalTimelineItem: UIView {
  // Circle
  @IBInspectable var diameter: CGFloat = 50.0
  @IBInspectable var strokeWidth: CGFloat = 2.0
  @IBInspectable var strokeColor: UIColor = UIColor.clearColor()
  @IBInspectable var fillColor: UIColor = UIColor.clearColor()

  // Line
  @IBInspectable var lineWidth: CGFloat = 2.0
  @IBInspectable var lineColor: UIColor = UIColor.clearColor()

  override func drawRect(rect: CGRect) {
    layer.addSublayer(lineLayer())
    layer.addSublayer(circleLayer())
  }

  private func circleLayer() -> CAShapeLayer {
    let shapeLayer = CAShapeLayer()

    shapeLayer.path = UIBezierPath(
      ovalInRect: CGRect(x: 0, y: 0, width: diameter, height: diameter)).CGPath

    shapeLayer.fillColor = fillColor.CGColor
    shapeLayer.strokeColor = strokeColor.CGColor
    shapeLayer.lineWidth = strokeWidth
    shapeLayer.position = CGPoint(
      x: CGRectGetMidX(bounds) - (diameter / 2.0),
      y: CGRectGetMidY(bounds) - (diameter / 2.0)
    )

    return shapeLayer
  }

  private func lineLayer() -> CAShapeLayer {
    let shapeLayer = CAShapeLayer()
    let path = UIBezierPath()
    path.moveToPoint(CGPoint(x: 0, y: 0))
    path.addLineToPoint(CGPoint(x: bounds.width, y: 0))
    path.closePath()

    shapeLayer.path = path.CGPath
    shapeLayer.strokeColor = lineColor.CGColor
    shapeLayer.lineWidth = lineWidth
    shapeLayer.position = CGPoint(x: 0, y: bounds.height / 2.0)

    return shapeLayer
  }
}
