import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let eggTimes = ["Soft": 60, "Medium": 7, "Hard": 12]
    var timer = Timer()
    var secondsRemaining = 60
    var interval: Float = 0.0
    
    @IBOutlet weak var TopLabel: UILabel!
    
    @IBOutlet weak var progressView: UIProgressView!
    
    var player: AVAudioPlayer!
    
    func playSound(SoundName : String) {
        let url = Bundle.main.url(forResource: SoundName, withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }
    
    @IBAction func hardnessSelected(_ sender: UIButton) {

        
        let hardness = sender.currentTitle
        
        progressView.progress = 0
        
        timer.invalidate()
        
        TopLabel.text = hardness
        
        secondsRemaining = (eggTimes[hardness ?? "Soft"]!)*60
        
        interval = 1.0/Float(secondsRemaining)
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true)
        { (Timer) in
            
            if self.secondsRemaining > 0 {
                    print ("\(self.secondsRemaining) seconds")
                self.progressView.progress += self.interval

                self.secondsRemaining -= 1
                
        }
            else {
                    Timer.invalidate()
                    self.TopLabel.text = "Done !"
                    self.playSound(SoundName: "alarm_sound")
                }
            
        }
  
    }

    
}
