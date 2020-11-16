//
//  KGHomeNavigationViewController.swift
//  KazemaGlobal
//
//  Created by Srishti on 09/11/20.
//  Copyright © 2020 Chitra S R. All rights reserved.
//

import UIKit
import MFSideMenu
class KGHomeNavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
       self.menuContainerViewController.panMode = MFSideMenuPanModeNone
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
      //  self.navigationController?.navigationBar.barTintColor = UIColor(red: 71/255, green: 193/255, blue: 240/255, alpha: 1.0)
        self.navigationItem.leftBarButtonItem =
            ({
                let sideBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 35, height: 40))
                sideBtn.addTarget(self, action: #selector(KGHomeNavigationViewController.toggleSidemenu), for: .touchUpInside)
                sideBtn.contentMode = .scaleAspectFit
                sideBtn.setTitleColor(UIColor.green, for: UIControl.State())
                sideBtn.setImage(UIImage(named: "sidebar"), for: UIControl.State())
                let rightBarButton :UIBarButtonItem = UIBarButtonItem(customView:sideBtn)
                return rightBarButton
            })()
    }
    
    
    @objc func toggleSidemenu()
      {
          self.menuContainerViewController.toggleLeftSideMenuCompletion(nil)
      }
}
