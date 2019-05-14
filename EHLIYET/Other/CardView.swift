//
//  CardView.swift
//  Ehliyet-2017
//
//  Created by YILMAZ ER on 24.01.2018.
//  Copyright © 2018 YILMAZER. All rights reserved.
//

import UIKit

@IBDesignable class CardView: UIView {

    @IBInspectable var cornerradius : CGFloat = 2
    
    @IBInspectable var shadownOffSetWidth : CGFloat = 1
    
    @IBInspectable var shadownOffSetHeight : CGFloat = 1
    
    @IBInspectable var shadownColor : UIColor = UIColor.black
    
    @IBInspectable var shadownOpacity : CGFloat = 10
    
    override func layoutSubviews() {
        
        layer.cornerRadius = cornerradius
        
        layer.shadowColor = shadownColor.cgColor
        
        layer.shadowOffset = CGSize(width: shadownOffSetWidth, height: shadownOffSetHeight)
        
        let shadownPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerradius)
        
        layer.shadowPath = shadownPath.cgPath
        
        layer.shadowOpacity = Float(shadownOpacity)
                
        
            
        
    }
    
    @IBInspectable var borderWith: CGFloat = 10 {
        
        didSet {
            self.layer.borderWidth = borderWith
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        
        didSet {
            self.layer.borderColor = borderColor.cgColor        }
    }
  
}
