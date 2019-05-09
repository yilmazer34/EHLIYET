//
//  QuizCVCell.swift
//  Quiz2
//
//  Created by Muskan on 11/4/17.
//  Copyright © 2017 akhil. All rights reserved.
//

import UIKit

protocol iAgustos18vcCellDelegate: class {
    func didChooseAnswer(btnIndex: Int)
}

class iAgustos18vcCell: UICollectionViewCell {
    
    var btn1: UIButton!
    var btn2: UIButton!
    var btn3: UIButton!
    var btn4: UIButton!
    var btnsArray = [UIButton]()
    
    weak var delegate: iAgustos18vcCellDelegate?
    
    var question: iAgustos18? {
        didSet {
            guard let unwrappedQue = question else { return }
            imgView.image = UIImage(named: unwrappedQue.imgName)
            lblQue.text = unwrappedQue.questionText
            btn1.setTitle(unwrappedQue.options[0], for: .normal)
            btn2.setTitle(unwrappedQue.options[1], for: .normal)
            btn3.setTitle(unwrappedQue.options[2], for: .normal)
            btn4.setTitle(unwrappedQue.options[3], for: .normal)
            
            if unwrappedQue.isAnswered {
                btnsArray[unwrappedQue.correctAns].backgroundColor=UIColor.green
                if unwrappedQue.wrongAns >= 0 {
                    btnsArray[unwrappedQue.wrongAns].backgroundColor=UIColor.red
                }
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        btnsArray = [btn1, btn2, btn3, btn4]
        prepareForReuse()
        //        setupTopConntrollers()
    }
    
    @objc func btnOptionAction(sender: UIButton) {
        guard let unwrappedQue = question else { return }
        if !unwrappedQue.isAnswered {
            delegate?.didChooseAnswer(btnIndex: sender.tag)
        }
    }
    
    override func prepareForReuse() {
        btn1.backgroundColor=UIColor.white
        btn2.backgroundColor=UIColor.white
        btn3.backgroundColor=UIColor.white
        btn4.backgroundColor=UIColor.white
        btn1.titleLabel?.lineBreakMode = .byCharWrapping
        btn1.titleLabel?.numberOfLines = 0
        btn1.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        btn2.titleLabel?.lineBreakMode = .byCharWrapping
        btn2.titleLabel?.numberOfLines = 0
        btn2.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        btn3.titleLabel?.lineBreakMode = .byCharWrapping
        btn3.titleLabel?.numberOfLines = 0
        btn3.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        btn4.titleLabel?.lineBreakMode = .byCharWrapping
        btn4.titleLabel?.numberOfLines = 0
        btn4.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        btn1.titleEdgeInsets.right = 5
        btn1.titleEdgeInsets.left = 2
        btn2.titleEdgeInsets.right = 5
        btn2.titleEdgeInsets.left = 2
        btn3.titleEdgeInsets.right = 5
        btn3.titleEdgeInsets.left = 2
        btn4.titleEdgeInsets.right = 5
        btn4.titleEdgeInsets.left = 2
        
    }
    
    func setupViews() {
        
        let topImagContainerView = UIView()
        self.addSubview(topImagContainerView)
        topImagContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        topImagContainerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 60).isActive = true
        topImagContainerView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        topImagContainerView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        topImagContainerView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.5).isActive = true
        
        let bottomContainerView = UIView()
        self.addSubview(bottomContainerView)
        bottomContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        let btnContainerView = UIView()
        self.addSubview(btnContainerView)
        btnContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        btnContainerView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
        btnContainerView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        btnContainerView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        btnContainerView.heightAnchor.constraint(equalToConstant:0).isActive = true
        
        bottomContainerView.topAnchor.constraint(equalTo: topImagContainerView.bottomAnchor, constant:0).isActive = true
        bottomContainerView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        bottomContainerView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        bottomContainerView.bottomAnchor.constraint(equalTo: btnContainerView.topAnchor, constant: 0).isActive = true
        
        topImagContainerView.addSubview(imgView)
        imgView.topAnchor.constraint(equalTo: topImagContainerView.topAnchor, constant:0).isActive=true
        imgView.trailingAnchor.constraint(equalTo: topImagContainerView.trailingAnchor, constant: 0).isActive = true
        imgView.leadingAnchor.constraint(equalTo: topImagContainerView.leadingAnchor, constant: 0).isActive = true
        imgView.bottomAnchor.constraint(equalTo: topImagContainerView.bottomAnchor, constant: 0).isActive = true

        btn1 = getButton(tag: 0)
        btn1.addTarget(self, action: #selector(btnOptionAction), for: .touchUpInside)
        btn2 = getButton(tag: 1)
        
        btn2.addTarget(self, action: #selector(btnOptionAction), for: .touchUpInside)
        
        btn3 = getButton(tag: 2)
        btn3.addTarget(self, action: #selector(btnOptionAction), for: .touchUpInside)
        
        btn4 = getButton(tag: 3)
        btn4.addTarget(self, action: #selector(btnOptionAction), for: .touchUpInside)
        
        let btnControllerStackview = UIStackView(arrangedSubviews: [btn1,btn2,btn3, btn4])
        
        btnControllerStackview.translatesAutoresizingMaskIntoConstraints = false
        btnControllerStackview.distribution = .fillEqually
        btnControllerStackview.axis = .vertical
        btnControllerStackview.spacing = 5
        
        bottomContainerView.addSubview(btnControllerStackview)
        
        NSLayoutConstraint.activate([
            btnControllerStackview.topAnchor.constraint(equalTo: bottomContainerView.topAnchor, constant: 0),
            btnControllerStackview.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            btnControllerStackview.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            bottomContainerView.bottomAnchor.constraint(equalTo: bottomContainerView.bottomAnchor, constant: 0),
            btnControllerStackview.heightAnchor.constraint(equalToConstant: frame.height / 3.5)
            ])
        
        
    }
    
    func getButton(tag: Int) -> UIButton {
        let btn=UIButton()
        btn.tag=tag
        btn.setTitle("Option", for: .normal)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.backgroundColor=UIColor.white
        btn.layer.borderWidth=1
        btn.layer.borderColor=UIColor.darkGray.cgColor
        btn.layer.cornerRadius=5
        btn.clipsToBounds=true
        btn.translatesAutoresizingMaskIntoConstraints=false
        return btn
    }
    
    let imgView: UIImageView = {
        let v=UIImageView()
        v.image = UIImage(named: "img1")
        v.contentMode = .scaleAspectFit
        v.translatesAutoresizingMaskIntoConstraints=false
        return v
    }()
    
    let lblQue: UILabel = {
        let lbl=UILabel()
        lbl.text="This is a question and you have to answer it?"
        lbl.textColor=UIColor.black
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 12)
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints=false
        
        return lbl
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
