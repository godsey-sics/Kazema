//
//  KGSideMenuTableViewController.swift
//  KazemaGlobal
//
//  Created by Srishti on 09/11/20.
//  Copyright © 2020 Chitra S R. All rights reserved.
//

import UIKit
import MFSideMenu

class KGSideMenuTableViewController: UITableViewController {
     var navController: UINavigationController!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return 160
        }else{
            return 45
        }
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row{
        case 1:
            let homePageVC = self.storyboard?.instantiateViewController(withIdentifier: "KGHomePageTableViewController") as! KGHomePageTableViewController
            gotoDestination(homePageVC)
        case 2:
            let maintenancePageVC = self.storyboard?.instantiateViewController(withIdentifier: "KGKazemaMaintenanceServiceViewController") as! KGKazemaMaintenanceServiceViewController
            gotoDestination(maintenancePageVC)
        case 3:
            let cleaningPageVC = self.storyboard?.instantiateViewController(withIdentifier: "KGCleaningServiceViewController") as!  KGCleaningServiceViewController
            gotoDestination(cleaningPageVC)
        case 4:
            let profilePageVC = self.storyboard?.instantiateViewController(withIdentifier: "KGUpgradeProfileViewController") as! KGUpgradeProfileViewController
            gotoDestination(profilePageVC)
        case 5:
            let notificationPageVC = self.storyboard?.instantiateViewController(withIdentifier: "KGNotificationViewController") as! KGNotificationViewController
            gotoDestination(notificationPageVC)
        case 6:
            
            let alertController = UIAlertController(title: nil, message: "Do you want to Logout?", preferredStyle: .alert)
            let YESAction = UIAlertAction(title: "Yes", style: .default){ (action) in
            }
            let NOAction = UIAlertAction(title: "No", style: .default){ (action) in
            }
            alertController.addAction(YESAction)
            alertController.addAction(NOAction)
            self.present(alertController, animated: true) {
                // ...
            }
        default:
            break
        }
    }
    func gotoDestination(_ destViewController:UIViewController){
        navController = self.menuContainerViewController.centerViewController as? UINavigationController
        let controllers = [destViewController]
        navController.viewControllers = controllers
        self.menuContainerViewController.menuState = MFSideMenuStateClosed
    }
}
