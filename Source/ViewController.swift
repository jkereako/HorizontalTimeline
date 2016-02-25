//
//  ViewController.swift
//  HorizontalTimeline
//
//  Created by Jeffrey Kereakoglow on 2/25/16.
//  Copyright © 2016 Alexis Digital. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var timeline: UIView!

  override func viewDidLoad() {
    super.viewDidLoad()

    let shapeLayer = CAShapeLayer()

    // Line
    let yPosition: CGFloat = timeline.bounds.height * 0.75

    // Dots
    let count = 4
    let diameter: CGFloat = 20.0

    let path = UIBezierPath()
    path.moveToPoint(CGPoint(x: 0, y: 0))
    path.addLineToPoint(CGPoint(x: UIScreen.mainScreen().bounds.width, y: 0))
    path.closePath()

    shapeLayer.path = path.CGPath
    shapeLayer.strokeColor = UIColor.blueColor().CGColor
    shapeLayer.lineWidth = 2.0
    shapeLayer.position = CGPoint(x: 0, y: yPosition)

    timeline.layer.addSublayer(shapeLayer)

    let spacing: CGFloat = UIScreen.mainScreen().bounds.width / CGFloat(count)
    let offset: CGFloat = (spacing / 2.0) - (diameter / 2.0)

    for i in 0..<count {
      let shapeLayer = CAShapeLayer()
      
      shapeLayer.path = UIBezierPath(
        ovalInRect: CGRect(x: 0, y: 0, width: diameter, height: diameter)
        ).CGPath
      shapeLayer.strokeColor = UIColor.blueColor().CGColor
      shapeLayer.lineWidth = 2.0
      shapeLayer.fillColor = UIColor.whiteColor().CGColor
      shapeLayer.position = CGPoint(
        x: (CGFloat(i) * spacing) + offset,
        y: yPosition - (diameter / 2.0)
      )
      
      timeline.layer.addSublayer(shapeLayer)
    }
  }

}

