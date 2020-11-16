//
//  ViewController.swift
//  KazemaGlobal
//
//  Created by Srishti on 06/11/20.
//  Copyright © 2020 Chitra S R. All rights reserved.
//

import UIKit

class KHomeViewController: UIViewController {
 var label  = UILabel()
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
        //button.addTarget(target, action: nil, for: .touchUpInside)
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
        //button.addTarget(target, action: nil, for: .touchUpInside)
        
        let barButtonItem2 = UIBarButtonItem(customView: button2)
        self.navigationItem.rightBarButtonItems = [barButtonItem, barButtonItem2]
        
        //Left Bar Button
        let button3 = UIButton(type: .custom)
        button3.setImage(UIImage (named: "sidebar"), for: .normal)
        button3.frame = CGRect(x: 0.0, y: 0.0, width: 30.0, height: 30.0)
        //button.addTarget(target, action: nil, for: .touchUpInside)
        let barButtonItem3 = UIBarButtonItem(customView: button3)
        self.navigationItem.leftBarButtonItem = barButtonItem3
        
    }

}

