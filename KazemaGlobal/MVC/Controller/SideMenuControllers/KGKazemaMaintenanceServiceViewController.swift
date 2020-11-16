//
//  KGKazemaMaintenanceServiceViewController.swift
//  KazemaGlobal
//
//  Created by Srishti on 10/11/20.
//  Copyright © 2020 Chitra S R. All rights reserved.
//

import UIKit

class KGKazemaMaintenanceServiceViewController: UIViewController,UIGestureRecognizerDelegate {
    
    @IBOutlet weak var viewWPC: CustomView!
    
    @IBOutlet weak var viewWPO: CustomView!
    @IBOutlet weak var ViewLO: CustomView!
    var isFromProfile = false
    var label  = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(clickView(_:)))
        tapGesture.delegate = self
        ViewLO.addGestureRecognizer(tapGesture)
        
        let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(clickView1(_:)))
        tapGesture1.delegate = self
        viewWPO.addGestureRecognizer(tapGesture1)
        
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(clickView2(_:)))
        tapGesture2.delegate = self
        viewWPC.addGestureRecognizer(tapGesture2)
    }
    @objc func clickView(_ sender: UIView) {
        let descriptionVC = self.storyboard?.instantiateViewController(withIdentifier: "KGDescriptionPageViewController") as!  KGDescriptionPageViewController
        descriptionVC.isFromProfile = true
        descriptionVC.desubtitle = "By Kazema Maintenance"
        descriptionVC.desString = "•  Labor only contracts without parts."
        descriptionVC.destitle = "Labor only contracts (LO)"
        self.navigationController?.pushViewController(descriptionVC, animated: true)
    }
    
    @objc func clickView1(_ sender: UIView) {
        let descriptionVC = self.storyboard?.instantiateViewController(withIdentifier: "KGDescriptionPageViewController") as!  KGDescriptionPageViewController
        descriptionVC.isFromProfile = true
        descriptionVC.desubtitle = "By Kazema Maintenance"
        descriptionVC.desString = "•  Contracts with parts without Compressors."
        descriptionVC.destitle = "Contracts with parts (WPO)"
        self.navigationController?.pushViewController(descriptionVC, animated: true)
    }
    @objc func clickView2(_ sender: UIView) {
          let descriptionVC = self.storyboard?.instantiateViewController(withIdentifier: "KGDescriptionPageViewController") as!  KGDescriptionPageViewController
          descriptionVC.isFromProfile = true
          descriptionVC.desubtitle = "By Kazema Maintenance"
          descriptionVC.desString = "•  Contracts with parts with Compressors."
          descriptionVC.destitle = "Contracts with parts and Compressors (WPC)"
          self.navigationController?.pushViewController(descriptionVC, animated: true)
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
        if isFromProfile == false{
            let button3 = UIButton(type: .custom)
            button3.setImage(UIImage (named: "sidebar"), for: .normal)
            button3.frame = CGRect(x: 0.0, y: 0.0, width: 30.0, height: 30.0)
            button3.addTarget(target, action: #selector(toggleSidemenu), for: .touchUpInside)
            let barButtonItem3 = UIBarButtonItem(customView: button3)
            self.navigationItem.leftBarButtonItem = barButtonItem3
            self.navigationController?.navigationBar.shadowImage = UIImage()
        }else{
            self.navigationItem.hidesBackButton = false
        }
    }
    
    @objc func toggleSidemenu()
    {
        DispatchQueue.main.async(execute: {
            self.menuContainerViewController.toggleLeftSideMenuCompletion(nil)
        })
    }
    
}
