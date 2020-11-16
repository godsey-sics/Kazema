//
//  KGNotificationViewController.swift
//  KazemaGlobal
//
//  Created by Srishti on 10/11/20.
//  Copyright © 2020 Chitra S R. All rights reserved.
//

import UIKit

class KGNotificationViewController: UIViewController {
    var label  = UILabel()
    @IBOutlet weak var tableViewNotification: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
    }
    //    MARK: Set Navigationbar
          func setNavigationBar(){
              // Middle Button
              let logo = UIImage(named: "logo")
              let imageView = UIImageView(image:logo)
              imageView.contentMode = .scaleAspectFit
              imageView.frame = CGRect(x: 0, y: 0, width: 35.0, height: 35.0)
              self.navigationItem.titleView = imageView
              
              //Right Bar Button
              let button = UIButton(type: .custom)
              button.setImage(UIImage (named: "bell"), for: .normal)
              button.frame = CGRect(x: 0.0, y: 0.0, width: 35.0, height: 35.0)
              label = UILabel(frame: CGRect(x: 20, y: 0, width: 18, height: 18))
              label.backgroundColor = UIColor.red
              label.text = "3"
              label.textColor = UIColor.white
              label.font = label.font.withSize(10)
              label.textAlignment = .center
              label.layer.cornerRadius = label.frame.size.width/2
              label.layer.masksToBounds = true
              button.addSubview(label)
              let barButtonItem = UIBarButtonItem(customView: button)
              
              let button2 = UIButton(type: .custom)
              button2.setImage(UIImage (named: "globe"), for: .normal)
              button2.frame = CGRect(x: 0.0, y: 0.0, width: 35.0, height: 35.0)
              
              let barButtonItem2 = UIBarButtonItem(customView: button2)
              self.navigationItem.rightBarButtonItems = [barButtonItem, barButtonItem2]
              
              //Left Bar Button
              let button3 = UIButton(type: .custom)
              button3.setImage(UIImage (named: "sidebar"), for: .normal)
              button3.frame = CGRect(x: 0.0, y: 0.0, width: 30.0, height: 30.0)
              button3.addTarget(target, action: #selector(toggleSidemenu), for: .touchUpInside)
              let barButtonItem3 = UIBarButtonItem(customView: button3)
              self.navigationItem.leftBarButtonItem = barButtonItem3
              self.navigationController?.navigationBar.shadowImage = UIImage()
          }
       
       @objc func toggleSidemenu()
       {
           DispatchQueue.main.async(execute: {
               self.menuContainerViewController.toggleLeftSideMenuCompletion(nil)
           })
       }
       
    
    
}
extension KGNotificationViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableViewNotification.dequeueReusableCell(withIdentifier: "NotificationCell") as! KGNotificationTableViewCell
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            print("deleting row")
            
        default:
            return
        }
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?{
        
        let shareAction = UIContextualAction(style: .destructive, title: "Delete") { (action, view, handler) in
        }
        shareAction.backgroundColor = UIColor.orange
        let configuration = UISwipeActionsConfiguration(actions: [shareAction])
        return configuration
    }
}
