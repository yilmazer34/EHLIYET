//
//  QuizVC.swift
//  Quiz2
//
//  Created by Muskan on 11/4/17.
//  Copyright © 2017 akhil. All rights reserved.
//

import UIKit

struct Question {
    let imgName: String
    let questionText: String
    let options: [String]
    let correctAns: Int
    var wrongAns: Int
    var isAnswered: Bool
}

class QuizVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var myCollectionView: UICollectionView!
    var questionsArray = [Question]()
    var score: Int = 0
    var inCorrect: Int = 0
    var Correct: Int = 0
    var currentQuestionNumber = 1
    
    var window: UIWindow?
    
    let quizScorLabel: UILabel = {
        let lbl=UILabel()
        lbl.text="1.Soru"
        lbl.textColor=UIColor.blue
        lbl.textAlignment = .center
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints=false
        return lbl
    }()
    
    let correctScorLabel: UILabel = {
        let lbl=UILabel()
        lbl.text="Doğru: 00"
        lbl.textColor=UIColor(red:0.26, green:0.55, blue:0.43, alpha:1.0)
        lbl.textAlignment = .center
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints=false
        return lbl
    }()
    
    let incorrectScorLabel: UILabel = {
        let lbl=UILabel()
        lbl.text="Yanlış: 00"
        lbl.textColor=UIColor.red
        lbl.textAlignment = .center
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints=false
        return lbl
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title="9 Mayıs İlk Yardım 2019"
//        self.navigationItem.prompt = "İlk ve Acil Yardım"
        self.view.backgroundColor=UIColor.black
    
        
        self.navigationItem.hidesBackButton = true
        
        let Cview = UIView()
        Cview.translatesAutoresizingMaskIntoConstraints = false
        Cview.backgroundColor = .black
        view.addSubview(Cview)
        
        Cview.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
        Cview.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        Cview.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        Cview.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: self.view.frame.width, height: self.view.frame.height)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        
        super.viewWillLayoutSubviews();
    
        myCollectionView=UICollectionView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height), collectionViewLayout: layout)
        
        myCollectionView.delegate=self
        myCollectionView.dataSource=self
        myCollectionView.register(QuizCVCell.self, forCellWithReuseIdentifier: "Cell")
        myCollectionView.showsHorizontalScrollIndicator = false
        myCollectionView.translatesAutoresizingMaskIntoConstraints=false
        myCollectionView.backgroundColor=UIColor.white
        myCollectionView.isPagingEnabled = true
        
        self.view.addSubview(myCollectionView)
        
        let que1 = Question(imgName: "img3", questionText: "I.Yüklerin üzerine yolcu bindirilmesi \nII. Kasanın yan ve arka kapaklarının kapalı olması \n III. Yüklerin sağlam olarak yerleştirilmiş ve bağlanmış olması \n\nKamyon, kamyonet ve römorklarda yükle birlikte yolcu taşınırken yukarıda veri- lenlerden hangilerinin yapılması zorun- ludur?", options: ["A) Bilinci yerinde ise sırtüstü pozisyonda bacakları bükülmüş olarak yatırılması", "B)Bilinci yerinde ise sırtüstü pozisyonda bacakları bükülmüş olarak yatırılması", "C) Bilinci yerinde ise sırtüstü pozisyonda bacakları bükülmüş olarak yatırılması", "D) Bilinci yerinde ise sırtüstü pozisyonda bacakları bükülmüş olarak yatırılması"], correctAns: 1, wrongAns: -1, isAnswered: false)
        let que2 = Question(imgName: "img4", questionText: "What is 4 + 2 ?", options: ["A) Bilinci yerinde ise sırtüstü pozisyonda bacakları bükülmüş olarak yatırılması", "B)Bilinci yerinde ise sırtüstü pozisyonda bacakları bükülmüş olarak yatırılması", "C) Bilinci yerinde ise sırtüstü pozisyonda bacakları bükülmüş olarak yatırılması", "D) Bilinci yerinde ise sırtüstü pozisyonda bacakları bükülmüş olarak yatırılması"], correctAns: 1, wrongAns: -1, isAnswered: false)
        let que3 = Question(imgName: "img2", questionText: "What is 6 / 2 ?", options: ["A) Bilinci yerinde ise sırtüstü pozisyonda bacakları bükülmüş olarak yatırılması", "B)Bilinci yerinde ise sırtüstü pozisyonda bacakları bükülmüş olarak yatırılması", "C) Bilinci yerinde ise sırtüstü pozisyonda bacakları bükülmüş olarak yatırılması", "D) Bilinci yerinde ise sırtüstü pozisyonda bacakları bükülmüş olarak yatırılması"], correctAns: 1, wrongAns: -1, isAnswered: false)
        let que4 = Question(imgName: "img1", questionText: "What is 2 - 2 ?", options: ["A) Bilinci yerinde ise sırtüstü pozisyonda bacakları bükülmüş olarak yatırılması", "B)Bilinci yerinde ise sırtüstü pozisyonda bacakları bükülmüş olarak yatırılması", "C) Bilinci yerinde ise sırtüstü pozisyonda bacakları bükülmüş olarak yatırılması", "D) Bilinci yerinde ise sırtüstü pozisyonda bacakları bükülmüş olarak yatırılması"], correctAns: 1, wrongAns: -1, isAnswered: false)
        let que5 = Question(imgName: "img2", questionText: "What is 12 x 2 ?", options: ["A) Bilinci yerinde ise sırtüstü pozisyonda bacakları bükülmüş olarak yatırılması", "B)Bilinci yerinde ise sırtüstü pozisyonda bacakları bükülmüş olarak yatırılması", "C) Bilinci yerinde ise sırtüstü pozisyonda bacakları bükülmüş olarak yatırılması", "D) Bilinci yerinde ise sırtüstü pozisyonda bacakları bükülmüş olarak yatırılması"], correctAns: 1, wrongAns: -1, isAnswered: false)
        let que6 = Question(imgName: "img1", questionText: "What is the color of sky?",options: ["A) Bilinci yerinde ise sırtüstü pozisyonda bacakları bükülmüş olarak yatırılması", "B)Bilinci yerinde ise sırtüstü pozisyonda bacakları bükülmüş olarak yatırılması", "C) Bilinci yerinde ise sırtüstü pozisyonda bacakları bükülmüş olarak yatırılması", "D) Bilinci yerinde ise sırtüstü pozisyonda bacakları bükülmüş olarak yatırılması"], correctAns: 1, wrongAns: -1, isAnswered: false)
        questionsArray = [que1, que2, que3, que4, que5, que6]
        
        setupViews()
        
        setupBottomConntrollers()
        setupTopConntrollers()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return questionsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell=collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! QuizCVCell
        cell.question=questionsArray[indexPath.row]
        cell.delegate=self
        return cell
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        setQuestionNumber()
    }
    
    func setQuestionNumber() {
        let x = myCollectionView.contentOffset.x
        let w = myCollectionView.bounds.size.width
        let currentPage = Int(ceil(x/w))
        if currentPage < questionsArray.count {
//            lblQueNumber.text = "Question: \(currentPage+1) / \(questionsArray.count)"
            currentQuestionNumber = currentPage + 1
            quizScorLabel.text = "\(currentPage+1).Soru"
        }
    }
    
    @objc func btnPrevNextAction(sender: UIButton) {
        if sender == btnNext && currentQuestionNumber == questionsArray.count {
//            let v=ResultVC()
//            v.score = score
//            v.totalScore = questionsArray.count
//            self.navigationController?.pushViewController(v, animated: false)
            return
        }
        
        let collectionBounds = self.myCollectionView.bounds
        var contentOffset: CGFloat = 0
        if sender == btnNext {
            contentOffset = CGFloat(floor(self.myCollectionView.contentOffset.x + collectionBounds.size.width))
            currentQuestionNumber += currentQuestionNumber >= questionsArray.count ? 0 : 1
        } else {
            contentOffset = CGFloat(floor(self.myCollectionView.contentOffset.x - collectionBounds.size.width))
            currentQuestionNumber -= currentQuestionNumber <= 0 ? 0 : 1
        }
        self.moveToFrame(contentOffset: contentOffset)
//        lblQueNumber.text = "Question: \(currentQuestionNumber) / \(questionsArray.count)"
        quizScorLabel.text = "\(currentQuestionNumber).Soru"
    }
    
    func moveToFrame(contentOffset : CGFloat) {
        let frame: CGRect = CGRect(x : contentOffset ,y : self.myCollectionView.contentOffset.y ,width : self.myCollectionView.frame.width,height : self.myCollectionView.frame.height)
        self.myCollectionView.scrollRectToVisible(frame, animated: true)
    }
    
    func setupViews() {
        myCollectionView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive=true
        myCollectionView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive=true
        myCollectionView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive=true
        myCollectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive=true
    }
    
    let btnPrev: UIButton = {
        let btn=UIButton()
        btn.setTitle("GERİ", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.backgroundColor = UIColor(red:0.21, green:0.42, blue:0.82, alpha:1)
        btn.layer.cornerRadius = 5
        btn.layer.borderWidth = 2
        btn.layer.borderColor = UIColor.white.cgColor
        btn.translatesAutoresizingMaskIntoConstraints=false
        btn.addTarget(self, action: #selector(btnPrevNextAction), for: .touchUpInside)
        return btn
    }()
    
    let btnNext: UIButton = {
        let btn=UIButton()
        btn.setTitle("İLERİ", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.backgroundColor = UIColor(red:0.26, green:0.55, blue:0.43, alpha:1.0)
        btn.layer.cornerRadius = 5
        btn.layer.borderWidth = 2
        btn.layer.borderColor = UIColor.white.cgColor
        btn.translatesAutoresizingMaskIntoConstraints=false
        btn.addTarget(self, action: #selector(btnPrevNextAction), for: .touchUpInside)
        return btn
    }()
    
    let quizFinish: UIButton = {
        let btn=UIButton()
        btn.setTitle("SINAVI BİTİR", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.backgroundColor = UIColor(red:1.00, green:0.27, blue:0.27, alpha:1.0)
        btn.layer.cornerRadius = 5
        btn.layer.borderWidth = 2
        btn.layer.borderColor = UIColor.white.cgColor
        btn.translatesAutoresizingMaskIntoConstraints=false
//        btn.addTarget(self, action: #selector(), for: .touchUpInside)
        return btn
    }()
    
    fileprivate func setupBottomConntrollers(){
        
        let yellowView = UIView()
        yellowView.backgroundColor = .yellow
        
        let greenView = UIView()
        greenView.backgroundColor = .white
        
        let blueView = UIView()
        blueView.backgroundColor = .blue
        
        let bottomControllerStackview = UIStackView(arrangedSubviews: [btnPrev,quizFinish,btnNext])
        
        bottomControllerStackview.translatesAutoresizingMaskIntoConstraints = false
        bottomControllerStackview.distribution = .fillEqually
        
        view.addSubview(bottomControllerStackview)
        
        NSLayoutConstraint.activate([
            bottomControllerStackview.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomControllerStackview.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomControllerStackview.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomControllerStackview.heightAnchor.constraint(equalToConstant: 40)
            ])
    }
}

extension QuizVC: QuizCVCellDelegate {
    func didChooseAnswer(btnIndex: Int) {
        let centerIndex = getCenterIndex()
        guard let index = centerIndex else { return }
        questionsArray[index.item].isAnswered=true
        if questionsArray[index.item].correctAns != btnIndex {
            questionsArray[index.item].wrongAns = btnIndex
//            score -= 1
            inCorrect += 1
        } else {
//            score += 1
            Correct += 1
        }
//        lblScore.text = "Score: \(score) / \(questionsArray.count)"
        correctScorLabel.text = "Doğru : \(Correct)"
        incorrectScorLabel.text = "Yanlış : \(inCorrect)"
        myCollectionView.reloadItems(at: [index])
    }
    
    func getCenterIndex() -> IndexPath? {
        let center = self.view.convert(self.myCollectionView.center, to: self.myCollectionView)
        let index = myCollectionView!.indexPathForItem(at: center)
        print(index ?? "index not found")
        return index
    }
    
    fileprivate func setupTopConntrollers(){
        
        let topControllerStackview = UIStackView(arrangedSubviews: [quizScorLabel,correctScorLabel,incorrectScorLabel])
        
        topControllerStackview.translatesAutoresizingMaskIntoConstraints = false
        topControllerStackview.distribution = .fillEqually
        
        view.addSubview(topControllerStackview)
        
        NSLayoutConstraint.activate([
            topControllerStackview.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            topControllerStackview.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            topControllerStackview.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            topControllerStackview.heightAnchor.constraint(equalToConstant: 20)
            ])
    }
    
   
}














