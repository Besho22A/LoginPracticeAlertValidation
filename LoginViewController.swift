//
//  ViewController.swift
//  LoginPracticeAlertValidation
//
//  Created by Beshoy Atef on 15/07/2025.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        if nameTextField.text?.isEmpty == true {
            createAlert(alertMessage: "Please Enter Your Name...")
        } else if passwordTextField.text?.isEmpty == true {
            createAlert(alertMessage: "Please Enter Your Password...")
        } else if emailTextField.text?.isEmpty == true {
            createAlert(alertMessage: "Please Enter Your E-mail")
        } else {
            //successAlert(alertTitle: "✅ Success", alertMessage: "Successfully Logged In")
            if let popupVC = storyboard?.instantiateViewController(identifier: "PopUpViewController") as? PopUpViewController {
                present(popupVC, animated: true)
            }
        }
    }
    func createAlert(alertMessage: String) {
        let alert = UIAlertController(title: "Error", message: alertMessage, preferredStyle: .alert)
        let OKButtonAlert = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(OKButtonAlert)
        present(alert, animated: true)
    }
    func successAlert(alertTitle: String, alertMessage: String) {
        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        let OKButtonAlert = UIAlertAction(title: "OK", style: .default) { (action) in
            self.navigateToNextScreen(VC: "DataBackViewController")
        }
        alert.addAction(OKButtonAlert)
        present(alert, animated: true)
    }
    func navigateToNextScreen(VC: String) {
        if let dataBackVC = storyboard?.instantiateViewController(identifier: VC) as? DataBackViewController {
            navigationController?.pushViewController(dataBackVC, animated: true)
        }
    }
}

