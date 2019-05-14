//
//  taAgst18VC.swift
//  EHLIYET
//
//  Created by YILMAZ ER on 5/11/19.
//  Copyright © 2019 YILMAZ ER. All rights reserved.
//

import UIKit
import CoreData

struct taAgst18 {
    let imgName: String
    let questionText: String
    let options: [String]
    let correctAns: Int
    var wrongAns: Int
    var isAnswered: Bool
}

class taAgst18VC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var lessonName:String = "taAgst18"
    var point: String = " "
    
    var myCollectionView: UICollectionView!
    var questionsArray = [taAgst18]()
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
        self.title = "4 Ağustos 2018 Araç Tekniği (Motor)"
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
        myCollectionView.register(taAgst18VCell.self, forCellWithReuseIdentifier: "Cell")
        myCollectionView.showsHorizontalScrollIndicator = false
        myCollectionView.translatesAutoresizingMaskIntoConstraints=false
        myCollectionView.backgroundColor=UIColor.white
        myCollectionView.isPagingEnabled = true
        
        self.view.addSubview(myCollectionView)
        
        let que45 = taAgst18(imgName: "i18A45", questionText: "", options: [
            "A) Trafikteki her kuralın altında yatan güvenlik gerekçelerinin sorgulanıp öğrenilmesi",
            "B) Kural ihlalinin sonucunda sadece maddi ceza olduğunun düşünülmesi",
            "C) Karşılıklı saygının öncelikle başkaların- dan beklenmesi",
            "D) Kızgın ve yarışmacı motivasyon ile araç kullanılması"], correctAns: 0, wrongAns: -1, isAnswered: false)
        let que46 = taAgst18(imgName: "i18A46", questionText: "", options: [
            "A) Davranışlarının sonuçlarını düşünerek hareket etmesi",
            "B) Sürekli şerit değiştirerek (slalom yapa- rak) araç kullanması",
            "C) Aracını kullanırken trafik kurallarının bilincinde olması",
            "D) Trafik içindeki davranışlarının sorumlulu- ğunu üstlenerek araç kullanması"], correctAns: 1, wrongAns: -1, isAnswered: false)
        let que47 = taAgst18(imgName: "i18A47", questionText: "", options: [
            "A) İnatlaşmaya",
            "B) Aşırı tepki göstermeye",
            "C) Kaba ve saldırgan davranmaya",
            "D) Trafik kültüründe birbirini uyarmaya"], correctAns: 3, wrongAns: -1, isAnswered: false)
        let que48 = taAgst18(imgName: "i18A48", questionText: "", options: [
            "A) Bencillik",
            "B) İnatlaşmak",
            "C) Diğergamlık",
            "D) Sorumsuzluk"], correctAns: 2, wrongAns: -1, isAnswered: false)
        let que49 = taAgst18(imgName: "i18A49", questionText: "", options: [
            "A) Dikkatin dağılması",
            "B) Kural ihlallerinin azalması",
            "C) Direksiyon hâkimiyetinin artması",
            "D) Kazaya karışma olasılığının azalması"], correctAns: 0, wrongAns: -1, isAnswered: false)
        let que50 = taAgst18(imgName: "i18A50", questionText: "", options: [
            "A) I ve II.",
            "B) I, III ve IV.",
            "C) II, III ve IV.",
            "D) I, II, III ve IV."], correctAns: 3, wrongAns: -1, isAnswered: false)
        
        questionsArray = [que45,que46,que47,que48,que49,que50]
        
        
        setupViews()
        setupBottomConntrollers()
        setupTopConntrollers()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return questionsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell=collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! taAgst18VCell
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
            
            btnQuizFinishAction()
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
        btn.addTarget(self, action: #selector(btnQuizFinishAction), for: .touchUpInside)
        return btn
    }()
    
    //    Sınavı Bitirme Butonu --->>
    
    @objc func btnQuizFinishAction() {
        
        point = String(format: "%.0f",(Float(100)/6) * Float(Correct))
        let rateSuccess = "%" + String(format: "%.0f",(Float(self.Correct) / 6) * 100)
        let rateCircle = Float(Correct) / 6
        
        let date = Date()
        
        let calender = Calendar.current
        let day = calender.component(.day, from: date)
        let month = calender.component(.month, from: date)
        let years = calender.component(.year, from: date)
        let hour = calender.component(.hour, from: date)
        let minute = calender.component(.minute, from: date)
        let saniye = calender.component(.second, from: date)
        
        var dateFormt: String = ""
        var clock: String = ""
        
        dateFormt = "\(day).\(month).\(years)"
        clock =  String(format: "%02d:%02d:%02d",hour,minute,saniye)
        
        
        
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let contex = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Results")
        
        fetchRequest.predicate = NSPredicate(format: "lessonName = %@", self.lessonName)
        
        fetchRequest.returnsObjectsAsFaults = false
        
        do {
            let results =  try contex.fetch(fetchRequest)
            if results.count > 0 {
                for result in results as! [NSManagedObject] {
                    contex.delete(result)
                    print("Core Data DELETE, <-- SUCCESS -->")
                }
            }
        } catch  {
            print(" DELETE <-- ERROR -->")
        }
        
        let newArt  = NSEntityDescription.insertNewObject(forEntityName: "Results", into: contex)
        
        // Attributes
        newArt.setValue(lessonName, forKey: "lessonName")
        newArt.setValue(clock, forKey: "clock")
        newArt.setValue(Correct, forKey: "correct")
        newArt.setValue(dateFormt, forKey: "date")
        newArt.setValue(inCorrect, forKey: "incorrect")
        newArt.setValue(point, forKey: "point")
        newArt.setValue(rateCircle, forKey: "rateC")
        newArt.setValue(rateSuccess, forKey: "rateSuc")
        
        do {
            try contex.save()
            print("Core Data is Save <-- SUCCUSS -->")
        } catch  {
            print("Core Data, no save <-- ERROR -->")
        }
        
        AlertView.instance.showAlert(point: point,rateSuc: rateSuccess, rateC: rateCircle, correct: "\(Correct)", inCorrect: "\(inCorrect)", Nil: "\((questionsArray.count) - (Correct + inCorrect))", alertType: .success)
        
        performSegue(withIdentifier: "taAgst18", sender: self)
    }
    
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

extension taAgst18VC: taAgst18VCellDelegate {
    func didChooseAnswer(btnIndex: Int) {
        let centerIndex = getCenterIndex()
        guard let index = centerIndex else { return }
        questionsArray[index.item].isAnswered=true
        if questionsArray[index.item].correctAns != btnIndex {
            questionsArray[index.item].wrongAns = btnIndex
            inCorrect += 1
        } else {
            Correct += 1
        }
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














