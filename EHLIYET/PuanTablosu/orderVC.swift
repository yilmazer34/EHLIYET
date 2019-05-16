//
//  orderVC.swift
//  EHLIYET
//
//  Created by YILMAZ ER on 5/12/19.
//  Copyright © 2019 YILMAZ ER. All rights reserved.
//

import UIKit
import Parse
import CoreData
import CRRefresh

class orderVC: UIViewController ,UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var orderTB: UITableView!
    @IBOutlet weak var orderLbl: UILabel!
    
    var ownerArray = [String]()
    var lessonnameArray = [String]()
    var pointArray = [Float]()
    var cityArray = [String]()
    var qTime = [String]()
    var pimgArray = [PFFileObject]()
    var scoreArray = [Int]()
    var userObjectID = [String]()
    var imgArray = [PFFileObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getData()
        
        /// animator: your customize animator, default is NormalHeaderAnimator
        orderTB.cr.addHeadRefresh(animator: NormalHeaderAnimator()) { [weak self] in
            
            /// start refresh
            /// Do anything you want...
            DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                /// Stop refresh when your job finished, it will reset refresh footer if completion is true
                
                self!.getData()
                self?.orderTB.cr.endHeaderRefresh()
            })
        }
        /// manual refresh
        orderTB.cr.beginHeaderRefresh()
        
        orderTB.cr.addFootRefresh(animator: NormalFooterAnimator()) { [weak self] in
            
            /// start refresh
            /// Do anything you want...
            DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                /// If common end
                self?.orderTB.cr.endLoadingMore()
                /// If no more data
                self?.orderTB.cr.noticeNoMoreData()
                /// Reset no more data
                self?.orderTB.cr.resetNoMore()
            })
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(getData), name: NSNotification.Name?(NSNotification.Name(rawValue: "newPost")), object: nil)
    }
    
    
    @objc func getData() {
        
        let query = PFQuery(className:"PointTab")
        query.order(byDescending: "point")
        query.findObjectsInBackground { (objects: [PFObject]?, error: Error?) in
            if let error = error {
                // Log details of the failure
                print(error.localizedDescription)
            } else if let objects = objects {
                // The find succeeded.
                print("Successfully retrieved \(objects.count) scores.")
                // Do something with the found objects
                self.ownerArray.removeAll(keepingCapacity: false)
                self.lessonnameArray.removeAll(keepingCapacity: false)
                self.pointArray.removeAll(keepingCapacity: false)
                self.cityArray.removeAll(keepingCapacity: false)
                self.pimgArray.removeAll(keepingCapacity: false)
                self.userObjectID.removeAll(keepingCapacity: false)
                self.qTime.removeAll(keepingCapacity: false)
                for object in objects {
                    if let lessonname = object["lessonname"] {
                        self.lessonnameArray.append(lessonname as! String)
                    }
                    if let city = object["city"] {
                        self.cityArray.append(city as! String)
                    }
                    if let point = object["point"] {
                        self.pointArray.append(point as! Float)
                    }
                    if let username = object["username"] {
                        self.ownerArray.append(username as! String)
                    }
                    if let city = object["city"] {
                        self.cityArray.append(city as! String)
                    }
                    if let pimg = object["pimg"] {
                        self.pimgArray.append(pimg as! PFFileObject)
                    }
                    if let qtime = object["qtime"] {
                        self.qTime.append(qtime as! String)
                    }
                }
                self.orderTB.reloadData()
            }
        }

    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ownerArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! OrderVCell
      
        cell.userName.text = ownerArray[indexPath.row]
        cell.lessonName.text = lessonnameArray[indexPath.row]
        cell.city.text = cityArray[indexPath.row]
        cell.userPoint.text = String(format: "%.0f",(pointArray[indexPath.row]))
        cell.qTime.text = qTime[indexPath.row]
        
        pimgArray[indexPath.row].getDataInBackground { (data, error) in
            if error != nil{
                AlertView2.instance.showAlert2(Error: error!.localizedDescription)
            } else {
                cell.Pimg.image = UIImage(data: data!)
            }
        }
       
        if ownerArray[indexPath.row] == PFUser.current()?.username {
            let sira = indexPath.row + 1
            self.scoreArray.append(sira)
            let scorR = scoreArray[0]
            self.orderLbl.text = String(scorR)
        }
       
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
  
}

public protocol CRRefreshProtocol {
    
    /// Customize view
    var view: UIView {get}
    
    /// View insets
    var insets: UIEdgeInsets {set get}
    
    /// The height of the trigger to refresh
    var trigger: CGFloat {set get}
    
    /// The height of the animation is executed
    var execute: CGFloat {set get}
    
    /// Start refresh
    mutating func refreshBegin(view: CRRefreshComponent)
    
    /// End refresh
    mutating func refreshEnd(view: CRRefreshComponent, finish: Bool)
    
    /// Refresh the progress changes
    mutating func refresh(view: CRRefreshComponent, progressDidChange progress: CGFloat)
    
    /// Refresh the state changes
    mutating func refresh(view: CRRefreshComponent, stateDidChange state: CRRefreshState)
}
