//
//  ilkyardim17.swift
//  Ehliyet-2017
//
//  Created by YILMAZ ER on 10.02.2018.
//  Copyright © 2018 YILMAZER. All rights reserved.
//

import UIKit
import CoreData

class ilkyardim: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var ilkyardim: UITableView!
    
    var lessonName:String = "iAgst18"
    
    var coz:String = "Çözüldü"
    var cozNO:String = "Çözülmedi"
    
    var correctTemmuz17 = Int()
    var incorrectTemmuz17 = Int()
    var puanTemmuz17 = String()
    var cozTemmuz17 = "Çözülmedi"
    var check2 = String()
    var boTemmuz17 = Float()
    var boTTemmuz17 = String()
    
    var correctMayis17 = Int()
    var incorrectMayis17 = Int()
    var puanMayis17 = String()
    var cozMayis17 = "Çözülmedi"
    var check3 = String()
    var boMayis17 = Float()
    var boTMayis17 = String()
    
    var correctSubat17 = Int()
    var incorrectSubat17 = Int()
    var puanSubat17 = String()
    var cozSubat17 = "Çözülmedi"
    var check4 = String()
    var boSubat17 = Float()
    var boTSubat17 = String()
    
    var correctSubat18 = Int()
    var incorrectSubat18 = Int()
    var puanSubat18 = String()
    var cozSubat18 = "Çözülmedi"
    var check5 = String()
    var boSubat18 = Float()
    var boTSubat18 = String()
    
    var correctNisan18 = Int()
    var incorrectNisan18 = Int()
    var puanNisan18 = String()
    var cozNisan18 = "Çözülmedi"
    var check6 = String()
    var boNisan18 = Float()
    var boTNisan18 = String()
    
    var correctAgustos18 = Int()
    var incorrectAgustos18 = Int()
    var puanAgustos18 = String()
    var cozAgustos18 = "Çözülmedi"
    var check1 = String()
    var boAgustos18 = Float()
    var boTAgustos18 = String()
    
    var diagnosticArray = [Diagnostic]()
    var currentDiagnoticArray = [Diagnostic]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getInfo()
        setupDiagnostics()
    }
    
    func getInfo() {

        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let contex = appDelegate.persistentContainer.viewContext

        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Results")
        
        fetchRequest.predicate = NSPredicate(format: "lessonName = %@", self.lessonName)
        
        fetchRequest.returnsObjectsAsFaults = false
        
        do {
            let results =  try contex.fetch(fetchRequest)
            if results.count > 0 {
                for result in results as! [NSManagedObject] {
                    if let correct = result.value(forKey: "correct") as? Int {
                        correctAgustos18 = correct
                    }
                    if let incorrect = result.value(forKey: "incorrect") as? Int {
                        incorrectAgustos18 = incorrect
                    }
                    if let point = result.value(forKey: "point") as? String {
                        puanAgustos18 = "\(point)"
                    }
                    if let rateSuc = result.value(forKey: "rateSuc") as? String {
                        boTAgustos18 = rateSuc
                    }
                    if let rateCirc = result.value(forKey: "rateC") as? Float {
                        boAgustos18 = rateCirc
                    }
                    cozSetup()
                }
            }
            print("Core Data Save, <-- SUCCESS -->")
        } catch  {
            print("No Save, <-- ERROR -->")
        }
    }
    
    func cozSetup() {
        if correctAgustos18 > 0 || incorrectAgustos18 > 0 {
            check1 = "check_vector1"
            cozAgustos18 = coz
        } else {
            cozAgustos18 = cozNO
        }
    }
    
    private func setupDiagnostics() {

        diagnosticArray.append(Diagnostic(title: "4 Ağustos 2018 İLK YARDIM",image:check1, correct:String(correctAgustos18), incorrect:String(incorrectAgustos18),cozum:String(cozAgustos18), puan: String(puanAgustos18),basariOrani:boTAgustos18, basariProgres:boAgustos18 ))
        diagnosticArray.append(Diagnostic(title: "21 Nisan 2018 İLK YARDIM",image:check6, correct:String(correctNisan18), incorrect:String(incorrectNisan18),cozum:String(cozNisan18), puan: String(puanNisan18),basariOrani:boTNisan18, basariProgres:boNisan18 ))
        diagnosticArray.append(Diagnostic(title: "10 Şubat 2018 İLK YARDIM",image:check5, correct:String(correctSubat18), incorrect:String(incorrectSubat18),cozum:String(cozSubat18), puan: String(puanSubat18),basariOrani:boTSubat18, basariProgres:boSubat18 ))
        diagnosticArray.append(Diagnostic(title: "29 Temmuz 2017 İLK YARDIM",image:check2, correct:String(correctTemmuz17), incorrect:String(incorrectTemmuz17),cozum:String(cozTemmuz17), puan: String(puanTemmuz17),basariOrani:boTTemmuz17, basariProgres:boTemmuz17 ))
        diagnosticArray.append(Diagnostic(title: "20 Mayıs 2017 İLK YARDIM",image:check3, correct:String(correctMayis17), incorrect:String(incorrectMayis17),cozum:String(cozMayis17), puan: String(puanMayis17),basariOrani:boTMayis17, basariProgres:boMayis17 ))
       
        
        currentDiagnoticArray = diagnosticArray
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentDiagnoticArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? ilkyardimCell else {
            return UITableViewCell()
        }
        
        cell.mTitle.text = currentDiagnoticArray[indexPath.row].title
        cell.mCheck.image = UIImage(named:currentDiagnoticArray[indexPath.row].image)
        cell.Correct.text = currentDiagnoticArray[indexPath.row].correct
        cell.inCorrect.text = currentDiagnoticArray[indexPath.row].incorrect
        cell.cozum.text = currentDiagnoticArray[indexPath.row].cozum
        cell.puanS.text = currentDiagnoticArray[indexPath.row].puan
        cell.basariOrani.text = currentDiagnoticArray[indexPath.row].basariOrani
        cell.basariProgress.value = currentDiagnoticArray[indexPath.row].basariProgres
        
        if cell.cozum.text == cozNO {
            cell.cozum.textColor = UIColor.red
        } else {
            cell.cozum.textColor = UIColor(red: 0, green: 0.5373, blue: 0.0784, alpha: 1.0)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vcName = currentDiagnoticArray[indexPath.row].title
        let viewController = storyboard?.instantiateViewController(withIdentifier: vcName)
        self.navigationController?.pushViewController(viewController!, animated: true)
    }
    
    
    class Diagnostic {
        
        let title:String
        let image:String
        var correct:String
        var incorrect:String
        var cozum:String
        var puan:String
        var basariOrani:String
        var basariProgres:Float
        
        init(title: String,image: String, correct:String, incorrect:String, cozum:String, puan:String, basariOrani:String, basariProgres:Float) {
            self.title = title
            self.image = image
            self.correct = correct
            self.incorrect = incorrect
            self.cozum = cozum
            self.puan = puan
            self.basariOrani = basariOrani
            self.basariProgres = basariProgres
        }
        
    }
   

    

}


