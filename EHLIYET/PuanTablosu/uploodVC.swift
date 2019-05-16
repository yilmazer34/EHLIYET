//
//  uploodVC.swift
//  EHLIYET
//
//  Created by YILMAZ ER on 5/12/19.
//  Copyright © 2019 YILMAZ ER. All rights reserved.
//

import UIKit
import Parse
import CoreData

class uploodVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var prfImg: UIImageView!
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var cityName: UITextField!
    let user = PFUser.current()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let keyboardRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        self.view.addGestureRecognizer(keyboardRecognizer)
        prfImg.setRounded()
        getData()
    
    }
    
    @objc func hideKeyboard() {
        self.view.endEditing(true)
    }
    
    func getData() {
        let currentUser = PFUser.current()
        userName.text = user?.username
        cityName.text = user!["city"] as? String
        let file = currentUser!["ProfileImage"] as! PFFileObject
        
        file.getDataInBackground { (data, error) in
            if error == nil {
                if let imagedata = data {
                    self.prfImg.image = UIImage(data: imagedata)
                }
            }
        }
    }
    
    @IBAction func LogOutAction(_ sender: Any) {
        PFUser.logOutInBackground { (error) in
            if error != nil {
                AlertView2.instance.showAlert2(Error: error!.localizedDescription)
            } else {
                // Initialize Alert Controller
                let alertController = UIAlertController(title: "DİKKAT", message: "\n\nHesabınızdan çıkmak istediğinize eminmisiniz ?", preferredStyle: .alert)
                // Initialize Actions
                let yesAction = UIAlertAction(title: "EVET", style: .default) { (action) -> Void in
                    print(" yes click")
                    self.loadHomeScreen()
                    PFUser.current()?.saveEventually()
                }
                let noAction = UIAlertAction(title: "HAYIR", style: .default) { (action) -> Void in
                    print("The user is not okay.")
                }
                // Add Actions
                alertController.addAction(yesAction)
                alertController.addAction(noAction)
                // Present Alert Controller
                self.present(alertController, animated: true, completion: nil)
            }
        }

    }
    
    func loadHomeScreen() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let loggedInViewController = storyBoard.instantiateViewController(withIdentifier: "Türkiye Puan Tablosu") as! enterVC
        self.present(loggedInViewController, animated: true, completion: nil)
    }
    

    @IBAction func selectedProfileImageActione(_ sender: Any) {
        chosePhoto()
    }
    
    @IBAction func Save(_ sender: Any) {
  
        if let currentUser = PFUser.current() {
            currentUser["username"] = userName.text
            currentUser["city"] = cityName.text
            let data = self.prfImg.image?.jpegData(compressionQuality: 0.20)
            let prfImage = PFFileObject(name: "prfImg", data: data!)
            currentUser["ProfileImage"] = prfImage
            
            let query = PFQuery(className:"PointTab")
            query.whereKey("userID", equalTo: currentUser.objectId as Any)
            query.findObjectsInBackground { (objects: [PFObject]?, error: Error?) in
                if let error = error {
                    // Log details of the failure
                    print(error.localizedDescription)
                } else if let objects = objects {
                    // The find succeeded.
                    print("Successfully retrieved \(objects.count) scores.")
                    // Do something with the found objects
                    for object in objects {
                        
                        do {
                            let data = self.prfImg.image?.jpegData(compressionQuality: 0.20)
                            let prfImage = PFFileObject(name: "prfImg", data: data!)
                            object["pimg"] = prfImage
                            try object.save()
                        } catch {
                            
                    }
                }
            }
        }
  
            let sv = UIViewController.displaySpinner(onView: self.view)
            currentUser.saveInBackground { (success, error) in
            if (success) {
                UIViewController.removeSpinner(spinner: sv)
                AlertView2.instance.showAlert2(Error: "Kayıt işlemi başarı ile tamamlandı 😊")
                } else {
                AlertView2.instance.showAlert2(Error: "\(error!.localizedDescription)")
                }
            }
        }
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "newPost"), object: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        prfImg.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    
    func chosePhoto() {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = .photoLibrary
        pickerController.allowsEditing = true
        present(pickerController,animated: true,completion: nil)
    }
    
    func displayErrorMessage(message:String) {
        let alertView = UIAlertController(title: "Error!", message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction) in
        }
        alertView.addAction(OKAction)
        if let presenter = alertView.popoverPresentationController {
            presenter.sourceView = self.view
            presenter.sourceRect = self.view.bounds
        }
        self.present(alertView, animated: true, completion:nil)
    }
    
}

