//
//  SignTextField.swift
//  Ehliyet-2017
//
//  Created by YILMAZ ER on 5/5/19.
//  Copyright © 2019 YILMAZER. All rights reserved.
//

import UIKit
@IBDesignable



class SignTextField: UITextField {
    
    override func layoutSubviews() {
        self.layer.borderColor = UIColor(white: 181/255, alpha: 1).cgColor
        self.layer.borderWidth = 1
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 8, dy: 7)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return textRect(forBounds: bounds)
    }
}
