import UIKit
extension UIButton{
    func roundedEdge(){
        self.layer.cornerRadius = self.frame.size.height / 2
    }
}
struct checkifValied{
    func isValidEmail(_ email: String) -> Bool {
        let emailPred = NSPredicate(format:"SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
        return emailPred.evaluate(with: email)
    }
    func isValidPassword(testStr:String?) -> Bool {
        guard testStr != nil else { return false }
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&]).{8,}$")
        return passwordTest.evaluate(with: testStr)
    }
}





