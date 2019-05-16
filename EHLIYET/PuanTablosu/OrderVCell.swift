




import UIKit

class OrderVCell: UITableViewCell {
    
//    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var Pimg: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var lessonName: UILabel!
    @IBOutlet weak var userPoint: UILabel!
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var qTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        Pimg.setCircleRound()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

extension UIImageView {

    func setCircleRound() {
        self.layer.cornerRadius = (self.frame.width / 8) //instead of let radius = CGRectGetWidth(self.frame) / 2
        self.layer.masksToBounds = true
    }
}
