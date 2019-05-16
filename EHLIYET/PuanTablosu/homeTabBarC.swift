//
//  homeTabBarC.swift
//  EHLIYET
//
//  Created by YILMAZ ER on 5/12/19.
//  Copyright © 2019 YILMAZ ER. All rights reserved.
//

import UIKit
import Parse

class homeTabBarC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let user = PFUser.current()
        print(user!.username as Any)

    }
}
