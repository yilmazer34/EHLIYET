//
//  LoginVC.swift
//  EHLIYET
//
//  Created by YILMAZ ER on 5/11/19.
//  Copyright © 2019 YILMAZ ER. All rights reserved.
//

import UIKit
import Parse

class LoginVC: UIViewController {

    @IBOutlet weak var prfImg: UIImageView!
    @IBOutlet weak var nameTextF: SignTextField!
    @IBOutlet weak var passwordTextF: SignTextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        prfImg.layer.cornerRadius = 30
        prfImg.layer.borderColor = UIColor.white.cgColor
        prfImg.layer.borderWidth = 2
    }

    @IBAction func LoginActionBtn(_ sender: Any) {
        let sv = UIViewController.displaySpinner(onView: self.view)
        PFUser.logInWithUsername(inBackground: nameTextF.text!, password: passwordTextF.text!) { (user, error) in
            UIViewController.removeSpinner(spinner: sv)
            if user != nil {
//                self.loadHomeScreen()
            }else{
                if let descrip = error?.localizedDescription{
                    print(descrip)
                    if descrip == "Invalid username/password." {
                        let descrip2 = "Kullanıcı adınız yada şifreniz yanlış."
                        AlertView2.instance.showAlert2(Error: descrip2)
                    }
                    else if descrip == "username/email is required." {
                        let descrip4 = "Kullanıcı adı ve şifre gerekli. 🙁"
                        AlertView2.instance.showAlert2(Error: descrip4)
                    }
                    else if descrip == "The Internet connection appears to be offline." {
                        let descrip3 = "İnternet bağlantısı kurulamadı. 🙁"
                        AlertView2.instance.showAlert2(Error: descrip3)
                    } else {
                        AlertView2.instance.showAlert2(Error: descrip)
                    }
                }
            }
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
    
}
