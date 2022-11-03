import UIKit
import FirebaseCore
import FirebaseAuth

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBAction func registerPressed(_ sender: UIButton) {
        
        if let email = emailTextfield.text, let password = passwordTextfield.text{
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error{
                    print(e.localizedDescription)//localized description helps to display the error in the local language which the user has selected for his iphone.
                    //You could make this error visible to the user by adding this as a string to some label's text.
                }
                else{
                    //Navigate to chatViewController
                    self.performSegue(withIdentifier: K.registerSegue, sender: self)
                }
            }
        }

        
        
    }
    
}
