//
//  SginUpVC.swift
//  Ehliyet-2017
//
//  Created by YILMAZ ER on 5/5/19.
//  Copyright © 2019 YILMAZER. All rights reserved.
//

import UIKit
import Parse

class SignUpVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
 
    @IBOutlet weak var prfImg: UIImageView!
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var cityName: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let keyboardRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        self.view.addGestureRecognizer(keyboardRecognizer)

       prfImg.setRounded()
    }
    
    @objc func hideKeyboard() {
        self.view.endEditing(true)
    }
    

    @IBAction func selectedProfileImageActione(_ sender: Any) {
       chosePhoto()
    }
    
    @IBAction func SignUp(_ sender: Any) {
        
        if password.text != "" && userName.text != "" && cityName.text != "" {
            let user = PFUser()
            user.username = self.userName.text
            user.password = self.password.text
            user["city"] = self.cityName.text
            let data = prfImg.image?.jpegData(compressionQuality: 0.20)
            let prfImage = PFFileObject(name: "prfImg", data: data!)
            user["ProfileImage"] = prfImage

            let sv = UIViewController.displaySpinner(onView: self.view)
            user.signUpInBackground { (success, error) in
                UIViewController.removeSpinner(spinner: sv)
                if success{
                    self.loadHomeScreen()
                }else{
                    if let descrip = error?.localizedDescription{
                        print(descrip)
                        if descrip == "Account already exists for this username." {
                            let descrip2 = "Bu kullanıcı adı için zaten bir hesap var. Lütfen yeni bir kullanıcı adı ile kayıt olun."
                            AlertView2.instance.showAlert2(Error: descrip2)
                        } else {
                             AlertView2.instance.showAlert2(Error: descrip)
                        }
                    }
                }
            }
        } else {
            AlertView2.instance.showAlert2(Error: "Lütfen isim ,  şehir  ve şifre alanlarını doldurunuz...")
        }
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
    
    func loadHomeScreen(){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let loggedInViewController = storyBoard.instantiateViewController(withIdentifier: "toHome") as! homeTabBarC
        self.present(loggedInViewController, animated: true, completion: nil)
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
    
}

extension UIImageView {
    
    func setRounded() {
        self.layer.cornerRadius = (self.frame.width / 2) //instead of let radius = CGRectGetWidth(self.frame) / 2
        self.layer.masksToBounds = true
    }
}
