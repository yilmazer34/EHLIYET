//
//  tAgst18VC.swift
//  EHLIYET
//
//  Created by YILMAZ ER on 5/11/19.
//  Copyright © 2019 YILMAZ ER. All rights reserved.
//

import UIKit
import CoreData
import Parse

struct tAgst18 {
    let imgName: String
    let questionText: String
    let options: [String]
    let correctAns: Int
    var wrongAns: Int
    var isAnswered: Bool
}

class tAgst18VC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var lessonName:String = "tAgst18"
    var point: String = " "
    
    var myCollectionView: UICollectionView!
    var questionsArray = [tAgst18]()
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
        self.title = "4 Ağustos 2018 Trafik ve Çevre"
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
        myCollectionView.register(tAgst18VCell.self, forCellWithReuseIdentifier: "Cell")
        myCollectionView.showsHorizontalScrollIndicator = false
        myCollectionView.translatesAutoresizingMaskIntoConstraints=false
        myCollectionView.backgroundColor=UIColor.white
        myCollectionView.isPagingEnabled = true
        
        self.view.addSubview(myCollectionView)
        
        let que13 = tAgst18(imgName: "i18A13", questionText: "", options: [
            "A) Karar verme ve kendini kontrol edebilme yeteneğinin azalması",
            "B) Yollarda tehdit unsuru oluşumunun azalması",
            "C) Kaza yapma riskinin azalması",
            "D) Sürüş yeteneğinin artması"], correctAns: 0, wrongAns: -1, isAnswered: false)
        
        let que14 = tAgst18(imgName: "i18A14", questionText: "", options: [
            "A) Sağlık Bakanlığı",
            "B) Millî Eğitim Bakanlığı",
            "C) Emniyet Genel Müdürlüğü",
            "D) Karayolları Genel Müdürlüğü"], correctAns: 3, wrongAns: -1, isAnswered: false)
        let que15 = tAgst18(imgName: "i18A15", questionText: "", options: [
            "A) Garaj",
            "B) Durak",
            "C) Otopark",
            "D) Park yeri"], correctAns: 1, wrongAns: -1, isAnswered: false)
        let que16 = tAgst18(imgName: "i18A16", questionText: "", options: ["A)","B)","C)","D)"], correctAns: 0, wrongAns: -1, isAnswered: false)
        let que17 = tAgst18(imgName: "i18A17", questionText: "", options: [
            "A) Banketten gitmelidir.",
            "B) Aracının hızını artırmalıdır.",
            "C) Öndeki aracı geçmemelidir.",
            "D) Geçiş hakkını kendisi kullanmalıdır."], correctAns: 2, wrongAns: -1, isAnswered: false)
        let que18 = tAgst18(imgName: "i18A18", questionText: "", options: ["A)","B)","C)","D)"], correctAns: 1, wrongAns: -1, isAnswered: false)
        let que19 = tAgst18(imgName: "i18A19", questionText: "", options: ["A)","B)","C)","D)"], correctAns: 2, wrongAns: -1, isAnswered: false)
        let que20 = tAgst18(imgName: "i18A20", questionText: "", options: [
            "A) Yaya geçidi",
            "B) Bisiklet yolu",
            "C) Taralı alana girilmez",
            "D) Yavaşlama uyarı çizgileri"], correctAns: 3, wrongAns: -1, isAnswered: false)
        let que21 = tAgst18(imgName: "i18A21", questionText: "", options: [
            "A) Sürücü belgesi 5 yıl süreyle geçici olarak geri alınır.",
            "B) Sadece şehir içinde araç sürmesine izin verilir.",
            "C) Sürücü belgesi 6 ay süreyle geri alınır.",
            "D) Sadece para cezası verilir."], correctAns: 0, wrongAns: -1, isAnswered: false)
        let que22 = tAgst18(imgName: "i18A22", questionText: "", options: ["A) 80 ","B) 90 ","C) 100 ","D) 110"], correctAns: 2, wrongAns: -1, isAnswered: false)
        let que23 = tAgst18(imgName: "i18A23", questionText: "", options: [
            "A) Öndeki aracın durması",
            "B) Öndeki aracın yavaşlaması",
            "C) Görüş mesafesinin kötü olması",
            "D) Takip mesafesi kurallarına uyulmaması"], correctAns: 3, wrongAns: -1, isAnswered: false)
        let que24 = tAgst18(imgName: "i18A24", questionText: "", options: ["A) 1","B) 2","C) 3","D) 4"], correctAns: 2, wrongAns: -1, isAnswered: false)
        let que25 = tAgst18(imgName: "i18A25", questionText: "", options: [
            "A) Ön, arka ve yanlardaki trafiği kontrol etmeli",
            "B) İşaret verdiği anda manevraya başlamalı",
            "C) Manevraya başladıktan sonra işaret vermeli",
            "D) Manevra bitmeden önce işaret vermeyi sona erdirmeli"], correctAns: 0, wrongAns: -1, isAnswered: false)
        let que26 = tAgst18(imgName: "i18A26", questionText: "", options: [
            "A) Korna çalıp 1 numaralı aracı durdurmalı",
            "B) 1 numaralı aracın geçmesini beklemeli",
            "C) Hızlanarak yoluna devam etmeli",
            "D) Geçiş hakkını kendisi kullanmalı"], correctAns: 1, wrongAns: -1, isAnswered: false)
        let que27 = tAgst18(imgName: "i18A27", questionText: "", options: [
            "A) Hız sınırlamasına",
            "B) Trafik yasaklarına",
            "C) Çevreyi rahatsız etmemeye",
            "D) Can ve mal güvenliğini tehlikeye sokmamaya"], correctAns: 3, wrongAns: -1, isAnswered: false)
        let que28 = tAgst18(imgName: "i18A28", questionText: "", options: ["A) 5","B) 10","C) 15","D) 20"], correctAns: 2, wrongAns: -1, isAnswered: false)
        let que29 = tAgst18(imgName: "i18A29", questionText: "", options: [
            "A) Birkaç defa selektör yaparak",
            "B) Acil uyarı ışıklarını yakarak",
            "C) Birkaç defa korna çalarak ",
            "D) Dönüş ışıklarını yakarak"], correctAns: 0, wrongAns: -1, isAnswered: false)
        let que30 = tAgst18(imgName: "i18A30", questionText: "", options: [
            "A) Yalnız I.",
            "B) I ve II.",
            "C) II ve III.",
            "D) I, II ve III."], correctAns: 2, wrongAns: -1, isAnswered: false)
        let que31 = tAgst18(imgName: "i18A31", questionText: "", options: [
            "A) Aracın sahibini bulamazsa yazılı bilgi bırakması",
            "B) Zarar fazla değilse olay yerinden uzak- laşması",
            "C) Zarar verdiği aracın sahibini bulması",
            "D) Trafik görevlisine haber vermesi"], correctAns: 1, wrongAns: -1, isAnswered: false)
        let que32 = tAgst18(imgName: "i18A32", questionText: "", options: [
            "A) Yalnız I.",
            "B) I ve II.",
            "C) II ve III.",
            "D) I, II ve III."], correctAns: 3, wrongAns: -1, isAnswered: false)
        let que33 = tAgst18(imgName: "i18A33", questionText: "", options: [
            "A) Bir meslek sahibi olmak",
            "B) Belirli bir eğitim seviyesine sahip olmak",
            "C) Kullanacağı araca göre belirli bir yaşın üzerinde olmak",
            "D) Sürücülük yapmaya uygun olduğunu gösterir sağlık raporu almak"], correctAns: 0, wrongAns: -1, isAnswered: false)
        let que34 = tAgst18(imgName: "i18A34", questionText: "", options: [
            "A) D - Y",
            "B) Y - D",
            "C) D - D",
            "D) Y - Y"], correctAns: 1, wrongAns: -1, isAnswered: false)
        let que35 = tAgst18(imgName: "i18A35", questionText: "", options: [
            "A) Kötü koku yayması",
            "B) Çirkin görünüm arz etmesi",
            "C) Hastalık bulaştıran zararlıların üremesine sebep olması",
            "D) Toplanıp işlenerek tekrar kullanılabilir hâle getirilmesi"], correctAns: 3, wrongAns: -1, isAnswered: false)
        
        questionsArray = [que13,que14,que15,que16,que17,que18,que19,que20,que21,que22,que23,que24,que25,que26,que27,que28,que29,que30,que31,que32,que33,que34,que35]
        
        setupViews()
        setupBottomConntrollers()
        setupTopConntrollers()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return questionsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell=collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! tAgst18VCell
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
        
        point = String(format: "%.0f",(Float(100)/23) * Float(Correct))
        let rateSuccess = "%" + String(format: "%.0f",(Float(self.Correct) / 23) * 100)
        let rateCircle = Float(Correct) / 23
        let userPoint = (Float(100)/23) * Float(Correct)
        
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
        
        let user = PFUser.current()
        let pointObj = PFObject(className: "PointTab")
        pointObj["lessonname"] = "4 Ağustos 2018 Trafik Adabı"
        pointObj["point"] = userPoint
        pointObj["userID"] = user?.objectId
        pointObj["username"] = user!.username
        pointObj["city"] = user?.object(forKey: "city")
        pointObj["pimg"] = user?.object(forKey: "ProfileImage")
        pointObj.saveEventually()
        
        AlertView.instance.showAlert(point: point,rateSuc: rateSuccess, rateC: rateCircle, correct: "\(Correct)", inCorrect: "\(inCorrect)", Nil: "\((questionsArray.count) - (Correct + inCorrect))", alertType: .success)
        
        performSegue(withIdentifier: "tAgst18", sender: self)
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

extension tAgst18VC: tAgst18VCellDelegate {
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














