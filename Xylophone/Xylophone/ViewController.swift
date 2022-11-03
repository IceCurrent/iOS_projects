import UIKit
import AVFoundation

//hold down option key and click on any purple term to get its quick summarized API.

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func keyPressed(_ sender: UIButton) {
        
        playSound(SoundName: sender.currentTitle!) //the purpose of adding an ! is to be ready for that case when we encounter a button that has no name, so it is like telling the function what to do in a default case situation.
        
        Task {
            // Do something
            sender.alpha = 0.5       //the universal fundae: who.what = value
            // Wait for 0.2 seconds
            try await Task.sleep(nanoseconds: 2_000_000_00)
            sender.alpha = 1
        }
        
    }
    
    func playSound(SoundName : String) {
        let url = Bundle.main.url(forResource: SoundName, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }


}

