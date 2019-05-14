//
//  CirclePath.swift
//  GraphicTabloPertage
//
//  Created by YILMAZ ER on 13.12.2017.
//  Copyright © 2017 YILMAZ ER. All rights reserved.
//

import UIKit

@IBDesignable 

class CirclePath: UIView {
    
    //    MARK: - Private Vars
    
    private let gradLayer = CAGradientLayer()
    private let shapeLayer = CAShapeLayer()
    private let backShape = CAShapeLayer()
//    private let label = UILabel()
  
    //    MARK: - Inspectables
    
    @IBInspectable var strokeWidth:CGFloat = 10 {
        didSet {
            layoutSubviews()
        }
    }
    
    @IBInspectable var lineWidth:CGFloat = 10 {
        didSet {
            layoutSubviews()
        }
    }
    
    @IBInspectable var strokeColor: UIColor = UIColor(white: 1, alpha: 0.5) {
        didSet {
            layoutSubviews()
        }
    }
    
    @IBInspectable var gradientColorA: UIColor = UIColor.red  {
        didSet {
            layoutSubviews()
        }
    }
    
    @IBInspectable var gradientColorB: UIColor = UIColor.yellow  {
        didSet {
            layoutSubviews()
        }
    }
    
    @IBInspectable var strokeOffset: CGFloat = 0.5 {
        didSet {
            layoutSubviews()
        }
    }
    
    //    MARK: -Public vars

    var value: Float = 0 {
        didSet {
//            draw stroke
            drawPath()
        }
    }
    
    func drawPath() {
        
        let strokeEnd = value > 0 ? value : 0
        shapeLayer.strokeEnd = CGFloat(strokeEnd)
//        let n = Int(value * 100)
//        label.text = "%\(n)"
    }
    
    //    MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        
//
//        
//        shapeLayer.strokeEnd = 0.375
//        shapeLayer.strokeStart = 0.125
//        
//        let a = CABasicAnimation(keyPath: "strokeEnd")
//        a.fromValue = 0
//        a.toValue = 1
//        a.duration = 25
//        shapeLayer.add(a, forKey: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //    MARK: -Class Overrides
    
    override func layoutSubviews() {
        
        setup()
    }
    

    
    //    MARK: - Private methods
    
    func setup() {
//      Set up back layer
        layer.addSublayer(backShape)
        
        layer.addSublayer(gradLayer)
        
        gradLayer.frame = bounds
        let colorA = gradientColorA.cgColor
        let colorB = gradientColorB.cgColor
        
        gradLayer.colors = [colorA, colorB]
        gradLayer.startPoint = CGPoint(x: 0, y: 0)
        gradLayer.endPoint = CGPoint(x: 1, y: 1)
        
//      Set up main stroke
        layer.addSublayer(shapeLayer)
        
        shapeLayer.frame = bounds
        
        layer.addSublayer(shapeLayer)
        
        let path = UIBezierPath()

        let cx = bounds.width / 2
        let cy = bounds.height / 2
        let c = CGPoint(x: cx, y: cy)
        var radius = cx < cy ? cx : cy
        radius = radius - (strokeWidth + strokeOffset) / 2

        let pi2 = CGFloat(M_PI * 2)

        let start = pi2 * 2 / 8

        let end = pi2 * 10 / 8

        path.addArc(withCenter: c , radius: radius, startAngle: start, endAngle: end, clockwise: true)
        
        shapeLayer.path = path.cgPath
        shapeLayer.lineWidth = lineWidth + strokeOffset
        shapeLayer.strokeColor = UIColor.white.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        
        shapeLayer.strokeEnd = CGFloat(value)
        shapeLayer.lineCap = CAShapeLayerLineCap(rawValue: "round")
        gradLayer.mask = shapeLayer
        
        
        backShape.path = path.cgPath
        backShape.fillColor = UIColor.clear.cgColor
        backShape.lineWidth = strokeWidth
        backShape.lineCap = CAShapeLayerLineCap(rawValue: "round")
        backShape.strokeColor = strokeColor.cgColor

    }
    
}
