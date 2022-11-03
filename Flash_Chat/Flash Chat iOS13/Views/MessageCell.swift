
import UIKit

class MessageCell: UITableViewCell {

    @IBOutlet weak var messageBubble: UIView!
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var rightImageView: UIImageView!
    
    @IBOutlet weak var leftImageView: UIImageView!
    
    //the method below is gonna be called when we create a new Message Cell.
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        //the below code is to make rounded corners to our message bubble, and that too with a dynamic radius dependent upon its height, so that when our cells grow in size then also the corner radius adapts accordingly.
        
        messageBubble.layer.cornerRadius = messageBubble.frame.size.height / 6.0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
