import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        progressBar.progress = 0
        
        // Do any additional setup after loading the view.
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        
        let userGotItRight = quizBrain.checkAns(userAnswer)
        
        quizBrain.nextQuestion()
        
        Task {
            // Do something
            if(userGotItRight){
                sender.backgroundColor = UIColor.green
            }
            else{
                sender.backgroundColor = UIColor.red
            }
            // Wait for 0.2 seconds
            try await Task.sleep(nanoseconds: 1_000_000_00)
            
            updateUI()

        }
     

    }
    
    func updateUI(){
        questionLabel.text = quizBrain.getQuestionText()
        
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
        progressBar.progress = quizBrain.getProgress()
        
    
    }
    
}

