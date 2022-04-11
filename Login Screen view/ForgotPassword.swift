

import UIKit

class ThirdViewController: UIViewController {
    var valied = checkifValied()
    @IBOutlet weak var submitbuttonn: UIButton!
    @IBOutlet weak var emailEntered: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        submitbuttonn.roundedEdge()
    }
    @IBAction func dismisstohome(_ sender: UIButton) {
        self.view.window!.rootViewController?.dismiss(animated: true, completion: nil)
    }
    func showAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Try Again", style: UIAlertAction.Style.default, handler: {(action) in alert.dismiss(animated: true, completion: nil)}))
        self.present(alert, animated: true, completion: nil)
    }
    @IBAction func SubmitPressed(_ sender: Any) {
        
        let email = valied.isValidEmail(emailEntered.text!)
        if email == false{
            showAlert(title: "Enter a Valied Email!", message: "This is not a valied email format")
            emailEntered.text = ""
        }
    }
    
}
