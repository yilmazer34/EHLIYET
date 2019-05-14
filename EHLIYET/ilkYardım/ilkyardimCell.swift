//
//  ilkyardim17Cell.swift
//  Ehliyet-2017
//
//  Created by YILMAZ ER on 10.02.2018.
//  Copyright © 2018 YILMAZER. All rights reserved.
//

import UIKit

class ilkyardimCell: UITableViewCell {
    
    @IBOutlet weak var mTitle: UILabel!
    @IBOutlet weak var mCheck: UIImageView!
    @IBOutlet weak var Correct: UILabel!
    @IBOutlet weak var inCorrect: UILabel!
    @IBOutlet weak var cozum: UILabel!
    @IBOutlet weak var puanS: UILabel!
    @IBOutlet weak var basariOrani: UILabel!
    @IBOutlet weak var basariProgress: CirclePath!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
