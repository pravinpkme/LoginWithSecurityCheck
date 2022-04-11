//
//  ViewController.swift
//  Login Screen view
//
//  Created by Pravin Kumar on 18/03/22.
//

import UIKit

class ViewController: UIViewController {
    var valied = checkifValied()
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    var iconClick = true
    @IBAction func iconAction(sender: AnyObject) {
        if(iconClick == true) {
            passwordField.isSecureTextEntry = false
        } else {
            passwordField.isSecureTextEntry = true
        }
        iconClick = !iconClick
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        submitButton.roundedEdge()
    }
    func showAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Try Again", style: UIAlertAction.Style.default, handler: {(action) in alert.dismiss(animated: true, completion: nil)}))
        self.present(alert, animated: true, completion: nil)
    }
    @IBAction func LoginPressed(_ sender: Any) {
        let email = valied.isValidEmail(emailField.text!)
        if email == false{
            showAlert(title: "Error! Check your Email ⚠️", message: "This is not a valied email")
            emailField.text = ""
        }
        let password = valied.isValidPassword(testStr: passwordField.text!)
        if password == false{
            showAlert(title: "Error! Check your Password ⚠️", message: "Password Strength is week")
            passwordField.text = ""
        }
    }
}
