//
//  Scroll.swift
//  Login Screen view
//
//  Created by Pravin Kumar on 19/03/22.
//

import UIKit

class ScrollViewController: UIViewController {
    var valied = checkifValied()
    @IBOutlet weak var supnameTextField: UITextField!
    @IBOutlet weak var supEmailTextField: UITextField!
    @IBOutlet weak var supContacttTextField: UITextField!
    @IBOutlet weak var supPasswordtextField: UITextField!
    @IBOutlet weak var submitPressed: UIButton!
    var iconClick = true
    @IBAction func iconAction(sender: AnyObject) {
        if(iconClick == true) {
            supPasswordtextField.isSecureTextEntry = false
        } else {
            supPasswordtextField.isSecureTextEntry = true
        }
        iconClick = !iconClick
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        submitPressed.roundedEdge()
    }
    func showAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Try Again", style: UIAlertAction.Style.default, handler: {(action) in alert.dismiss(animated: true, completion: nil)}))
        self.present(alert, animated: true, completion: nil)
    }
    @IBAction func SubmitPressed(_ sender: UIButton) {
        let email = valied.isValidEmail(supEmailTextField.text!)
        if email == false{
            showAlert(title: "Enter a Valied Email!", message: "This is not a valied email format")
            supEmailTextField.text = ""
        }
        let password = valied.isValidPassword(testStr: supPasswordtextField.text!)
        if password == false{
            showAlert(title: "Check your Password", message: "Create a Strong Password")
            supPasswordtextField.text = ""
        }
        
        
    }
    @IBAction func backtologin(_ sender: UIButton) {
        self.view.window!.rootViewController?.dismiss(animated: true, completion: nil)
        
    }
}

