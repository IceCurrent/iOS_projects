import UIKit
import CLTypingLabel

class WelcomeViewController: UIViewController {

    @IBOutlet weak var titleLabel: CLTypingLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = K.appName
        
//        var charIndex = 0.0
//        titleLabel.text = ""
//        let title = "⚡️FlashChat"
//        for letter in title {
//            //Another good way of creating a time delay is by using Timer
//            //without charIndex timer wouldn't work because, we have as many timers as we have letters, and thus all of them start at pretty much the same time.
//
//            Timer.scheduledTimer(withTimeInterval: 0.1*charIndex, repeats: false) { timer in
//                self.titleLabel.text?.append(letter)
//
//            }
//            charIndex+=1
//
//        }
    }
    

}
