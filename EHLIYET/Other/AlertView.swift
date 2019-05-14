//
//  AlertView.swift
//  CustomAlert
//
//  Created by SHUBHAM AGARWAL on 31/12/18.
//  Copyright © 2018 SHUBHAM AGARWAL. All rights reserved.
//

import Foundation
import UIKit

class AlertView: UIView {
    
    static let instance = AlertView()
    
    @IBOutlet weak var pointLbl: UILabel!
    @IBOutlet weak var rateCircle: CirclePath!
    @IBOutlet weak var rateSuccess: UILabel!
    @IBOutlet var parentView: UIView!
    @IBOutlet weak var alertView: UIView!
    @IBOutlet weak var img: UIImageView!
//    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var correctLbl: UILabel!
    @IBOutlet weak var IncorrectLbl: UILabel!
    @IBOutlet weak var NilLbl: UILabel!
    @IBOutlet weak var doneBtn: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        Bundle.main.loadNibNamed("AlertView", owner: self, options: nil)
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
    
    enum AlertType {
        case success
        case failure
    }
    
    func showAlert(point: String,rateSuc: String, rateC: Float,correct: String,inCorrect:String,Nil:String, alertType: AlertType) {
        
        self.pointLbl.text = "Puan: " + String(point)
        self.rateCircle.value = rateC
        self.rateSuccess.text = String(rateSuc) + "\n\nBaşarı Oranı"
        self.correctLbl.text = "Doğru : "  + correct
        self.IncorrectLbl.text = "Yanlış :"  + inCorrect
        self.NilLbl.text = "Boş : " + Nil
        
        switch alertType {
        case .success:
            img.image = UIImage(named: "resultImg")
            doneBtn.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        case .failure:
            img.image = UIImage(named: "Failure")
            doneBtn.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        }
        
        UIApplication.shared.keyWindow?.addSubview(parentView)
    }
    
    
    
    @IBAction func onClickDone(_ sender: Any) {
        parentView.removeFromSuperview()
        print("Tamam tıklandı alert dialogda")
        
    }
    
    
    
    
    
    
    
}
