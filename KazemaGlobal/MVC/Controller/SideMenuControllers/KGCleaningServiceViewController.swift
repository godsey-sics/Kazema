//
//  KGCleaningServiceViewController.swift
//  KazemaGlobal
//
//  Created by Srishti on 10/11/20.
//  Copyright © 2020 Chitra S R. All rights reserved.
//

import UIKit

class KGCleaningServiceViewController: UIViewController,UIGestureRecognizerDelegate {
    @IBOutlet weak var viewChandelier: CustomView!
    @IBOutlet weak var viewCarpet: CustomView!
    @IBOutlet weak var viewMarble: CustomView!
    @IBOutlet weak var viewBuilding: CustomView!
    @IBOutlet weak var viewKitchen: CustomView!
    @IBOutlet weak var viewPestControl: CustomView!
    var isFromProfile = false
    var label  = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(clickView(_:)))
        tapGesture.delegate = self
        viewPestControl.addGestureRecognizer(tapGesture)
        
        let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(clickView1(_:)))
        tapGesture1.delegate = self
        viewKitchen.addGestureRecognizer(tapGesture1)
        
        let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(clickView2(_:)))
        tapGesture2.delegate = self
        viewBuilding.addGestureRecognizer(tapGesture2)
        
        let tapGesture3 = UITapGestureRecognizer(target: self, action: #selector(clickView3(_:)))
        tapGesture3.delegate = self
        viewMarble.addGestureRecognizer(tapGesture3)
        
        let tapGesture4 = UITapGestureRecognizer(target: self, action: #selector(clickView4(_:)))
        tapGesture4.delegate = self
        viewCarpet.addGestureRecognizer(tapGesture4)
        
        let tapGesture5 = UITapGestureRecognizer(target: self, action: #selector(clickView5(_:)))
        tapGesture5.delegate = self
        viewChandelier.addGestureRecognizer(tapGesture5)
    }
    @objc func clickView(_ sender: UIView) {
        let descriptionVC = self.storyboard?.instantiateViewController(withIdentifier: "KGDescriptionPageViewController") as!  KGDescriptionPageViewController
        descriptionVC.isFromProfile = true
        let bullet = " "
        var strings = [String]()
        strings.append("We implement the latest techniques in destroying pests in residential buildings as well as sites under construction.We use safe pest control materials which are approved by Ministry of Health(MOH).")
        strings.append("Licensed by MOH since 1998 (No.17).")
        
        strings = strings.map { return bullet + $0 }
        
        var attributes = [NSAttributedString.Key: Any]()
        attributes[.font] = UIFont.preferredFont(forTextStyle: .body)
        attributes[.foregroundColor] = UIColor.black
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.headIndent = (bullet as NSString).size(withAttributes: attributes).width
        attributes[.paragraphStyle] = paragraphStyle
        
        let string = strings.joined(separator: "\n")
        
        descriptionVC.desKrsString = NSAttributedString(string: string, attributes: attributes)
        descriptionVC.destitle = "Pest Control Service"
        descriptionVC.desubtitle = "By Klean Rite"
        self.navigationController?.pushViewController(descriptionVC, animated: true)
    }
    
    @objc func clickView1(_ sender: UIView) {
        let descriptionVC = self.storyboard?.instantiateViewController(withIdentifier: "KGDescriptionPageViewController") as!  KGDescriptionPageViewController
        descriptionVC.isFromProfile = true
        var strings = [String]()
        strings.append("Avoid the risk of fires caused by oil, grease, pollutants inside your kitchen hood and exhaust fans. We at Klean Rite clean the following :")
        strings.append("• Restaurants kitchen hood.")
        strings.append("• Hotels Kitchen Hood.")
        strings.append("• Hospitals Kitchen Hood.")
        strings.append("We Provide customers with CD of your kitchen hood before and after cleaning.")
        
        var attributes = [NSAttributedString.Key: Any]()
        attributes[.font] = UIFont.preferredFont(forTextStyle: .body)
        attributes[.foregroundColor] = UIColor.black
        
        let string = strings.joined(separator: "\n\n")
        descriptionVC.desKrsString = NSAttributedString(string: string, attributes: attributes)
        descriptionVC.destitle = "Kitchen Hoods Cleaning Service"
        descriptionVC.desubtitle = "By Klean Rite"
        self.navigationController?.pushViewController(descriptionVC, animated: true)
    }
    @objc func clickView2(_ sender: UIView) {
        let descriptionVC = self.storyboard?.instantiateViewController(withIdentifier: "KGDescriptionPageViewController") as!  KGDescriptionPageViewController
        descriptionVC.isFromProfile = true
        descriptionVC.desubtitle = "By Klean Rite"
        var strings = [String]()
        strings.append("We are using Pure Clean System from UK for cleaning the following:")
        strings.append("• Stone cleaning and protection")
        strings.append("• Glass cleaning")
        strings.append("• Sigma cleaning")
        strings.append("By Using")
        strings.append("• 100% pure water")
        strings.append("• No scaffolding required")
        strings.append("• Without wiping")
        var attributes = [NSAttributedString.Key: Any]()
        attributes[.font] = UIFont.preferredFont(forTextStyle: .body)
        attributes[.foregroundColor] = UIColor.black
        
        let string = strings.joined(separator: "\n\n")
        descriptionVC.desKrsString = NSAttributedString(string: string, attributes: attributes)
        descriptionVC.destitle = "Building External Cleaning Service"
        self.navigationController?.pushViewController(descriptionVC, animated: true)
    }
    @objc func clickView3(_ sender: UIView) {
        let descriptionVC = self.storyboard?.instantiateViewController(withIdentifier: "KGDescriptionPageViewController") as!  KGDescriptionPageViewController
        descriptionVC.isFromProfile = true
        descriptionVC.desubtitle = "By Klean Rite"
        var strings = [String]()
        strings.append("Klean rite provides specialist services of marble grinding and polishing with diamond discs and use the best machines to give the marble re-brightness by using latest techniques to ensure superb quality")
        var attributes = [NSAttributedString.Key: Any]()
        attributes[.font] = UIFont.preferredFont(forTextStyle: .body)
        attributes[.foregroundColor] = UIColor.black
        let string = strings.joined(separator: "")
        descriptionVC.desKrsString = NSAttributedString(string: string, attributes: attributes)
        descriptionVC.destitle = "Marble Grinding & Polishing Service with Diamond Discs"
        self.navigationController?.pushViewController(descriptionVC, animated: true)
    }
    
    @objc func clickView4(_ sender: UIView) {
        let descriptionVC = self.storyboard?.instantiateViewController(withIdentifier: "KGDescriptionPageViewController") as!  KGDescriptionPageViewController
        descriptionVC.isFromProfile = true
        descriptionVC.desubtitle = "By Klean Rite"
        let bullet = "•  "
        var strings = [String]()
        strings.append("Carpet cleaning and sanitizing without using shampoo.")
        strings.append("Persian rug Cleaning.")
        strings.append("Upholstery Cleaning.")
        strings.append("Bring brightness to all types of carpets and sofas.")
        strings = strings.map { return bullet + $0 }
        
        var attributes = [NSAttributedString.Key: Any]()
        attributes[.font] = UIFont.preferredFont(forTextStyle: .body)
        attributes[.foregroundColor] = UIColor.black
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.headIndent = (bullet as NSString).size(withAttributes: attributes).width
        attributes[.paragraphStyle] = paragraphStyle
        
        let string = strings.joined(separator: "\n")
        
        descriptionVC.desKrsString = NSAttributedString(string: string, attributes: attributes)
        descriptionVC.destitle = "Carpet Cleaning Service"
        self.navigationController?.pushViewController(descriptionVC, animated: true)
    }
    @objc func clickView5(_ sender: UIView) {
        let descriptionVC = self.storyboard?.instantiateViewController(withIdentifier: "KGDescriptionPageViewController") as!  KGDescriptionPageViewController
        descriptionVC.isFromProfile = true
        descriptionVC.desubtitle = "By Klean Rite"
        let bullet = "•  "
        var strings = [String]()
        strings.append("Chandelier cleaning and polishing.")
        strings.append("Ensure brightness and best shines of chandeliers.")
        strings = strings.map { return bullet + $0 }
        
        var attributes = [NSAttributedString.Key: Any]()
        attributes[.font] = UIFont.preferredFont(forTextStyle: .body)
        attributes[.foregroundColor] = UIColor.black
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.headIndent = (bullet as NSString).size(withAttributes: attributes).width
        attributes[.paragraphStyle] = paragraphStyle
        
        let string = strings.joined(separator: "\n")
        
        descriptionVC.desKrsString = NSAttributedString(string: string, attributes: attributes)
        descriptionVC.destitle = "Chandelier Cleaning Service"
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
