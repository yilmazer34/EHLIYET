//
//  AlerView2.swift
//  EHLIYET
//
//  Created by YILMAZ ER on 5/12/19.
//  Copyright © 2019 YILMAZ ER. All rights reserved.
//

import Foundation
import UIKit

class AlertToHome: UIView {
    
    static let instance = AlertToHome()
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var errorLbl: UILabel!
    @IBOutlet weak var alertView: CardView!
    @IBOutlet var parentView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        Bundle.main.loadNibNamed("AlertView2", owner: self, options: nil)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        img.layer.cornerRadius = 30
        img.layer.borderColor = UIColor.white.cgColor
        img.layer.borderWidth = 2
        
        alertView.layer.cornerRadius = 10
        
        parentView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        parentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    func showAlert(Error: String) {
        self.errorLbl.text = Error
        UIApplication.shared.keyWindow?.addSubview(parentView)
    }
    
    
    
    @IBAction func onClickDone(_ sender: Any) {
        print("to home alert e tıklandı.")
    }
    
}
