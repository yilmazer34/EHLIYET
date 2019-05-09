//
//  HomeCollectionViewCell.swift
//  EHLIYET
//
//  Created by YILMAZ ER on 5/7/19.
//  Copyright © 2019 YILMAZ ER. All rights reserved.
//

import UIKit

let HomeImage: UIImageView = {
    let v=UIImageView()
    v.image = UIImage(named: "bisiklet.jpg")
    v.contentMode = .scaleAspectFit
    v.translatesAutoresizingMaskIntoConstraints=false
    return v
}()

class HomeCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var HomeImage: UIImageView!
    @IBOutlet weak var HomeLabel: UILabel!
}

