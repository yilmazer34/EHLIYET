//
//  RoundButton.swift
//  Reçete Rehberi
//
//  Created by YILMAZ on 8/22/17.
//  Copyright © 2017 YILMAZ. All rights reserved.
//

import UIKit

@IBDesignable

class RoundButton: UIButton {

    @IBInspectable var cornerRadius:CGFloat = 0 {
        
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
        
    }
    
    @IBInspectable var borderWith: CGFloat = 0 {
        
        didSet {
            self.layer.borderWidth = borderWith
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        
        didSet {
            self.layer.borderColor = borderColor.cgColor        }
    }
}
