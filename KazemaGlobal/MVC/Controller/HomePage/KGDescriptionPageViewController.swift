//
//  KGDescriptionPageViewController.swift
//  KazemaGlobal
//
//  Created by Srishti on 11/11/20.
//  Copyright © 2020 Chitra S R. All rights reserved.
//

import UIKit

class KGDescriptionPageViewController: UIViewController {
    
    
    @IBOutlet weak var desSubTitle: UILabel!
    @IBOutlet weak var descTitle: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var btnEnquiryForm: UIButton!
    @IBOutlet weak var btnReview: UIButton!
    @IBOutlet weak var btnDescription: UIButton!
    
    
    @IBOutlet weak var viewEnquiryForm: UIView!
    @IBOutlet weak var viewReview: UIView!
    @IBOutlet weak var viewDescription: UIView!
    var isFromProfile = false
    var subDesVc : KGSubDescriptionViewController?
    var subKrsVC : KGKleanSubDescriptionTableViewController?
    var enquiry : KGEnquiryFormViewController?
    var review : KGReviewViewController?
    var label  = UILabel()
    var desString : String?
    var desKrsString :NSAttributedString?
    var destitle : String?
    var desubtitle : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        setUp()
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
    func setUp(){
        descTitle.text = destitle
        desSubTitle.text = desubtitle
        viewEnquiryForm.backgroundColor = #colorLiteral(red: 0.9200000167, green: 0.9200000167, blue: 0.9200000167, alpha: 1)
        viewReview.backgroundColor = #colorLiteral(red: 0.9200000167, green: 0.9200000167, blue: 0.9200000167, alpha: 1)
        viewDescription.backgroundColor = #colorLiteral(red: 1, green: 0.5843137255, blue: 0, alpha: 1)
        btnDescription.setTitleColor(.orange, for: .normal)
        btnReview.setTitleColor(#colorLiteral(red: 0, green: 0.3403271139, blue: 0.5711781383, alpha: 1), for: .normal)
        btnEnquiryForm.setTitleColor(#colorLiteral(red: 0, green: 0.3403271139, blue: 0.5711781383, alpha: 1), for: .normal)
        
        if desSubTitle.text != "By Klean Rite"{
            subDesVc = (self.storyboard?.instantiateViewController(withIdentifier: "KGSubDescriptionViewController") as? KGSubDescriptionViewController)!
            subDesVc?.descriptionString = desString
            self.addChild(subDesVc!)
            subDesVc?.view.frame = self.containerView.bounds
            containerView.addSubview((subDesVc?.view)!)
            subDesVc?.didMove(toParent: self)
        }else{
            subKrsVC = (self.storyboard?.instantiateViewController(withIdentifier: "KGKleanSubDescriptionTableViewController") as? KGKleanSubDescriptionTableViewController)!
            subKrsVC?.descriptionNsAttributedString = desKrsString
            self.addChild(subKrsVC!)
            subKrsVC?.view.frame = self.containerView.bounds
            containerView.addSubview((subKrsVC?.view)!)
            subKrsVC?.didMove(toParent: self)
        }
        
        
    }
    
    @IBAction func actionReview(_ sender: UIButton) {
        if subDesVc != nil{
            subDesVc?.view.removeFromSuperview()
        }
        if enquiry != nil{
            enquiry?.view.removeFromSuperview()
        }
        if subKrsVC != nil{
            subKrsVC?.view.removeFromSuperview()
        }
        if review != nil{
            review?.view.removeFromSuperview()
        }
        viewEnquiryForm.backgroundColor = #colorLiteral(red: 0.9200000167, green: 0.9200000167, blue: 0.9200000167, alpha: 1)
        viewDescription.backgroundColor = #colorLiteral(red: 0.9200000167, green: 0.9200000167, blue: 0.9200000167, alpha: 1)
        viewReview.backgroundColor = #colorLiteral(red: 1, green: 0.5843137255, blue: 0, alpha: 1)
        btnReview.setTitleColor(.orange, for: .normal)
        btnDescription.setTitleColor(#colorLiteral(red: 0, green: 0.3403271139, blue: 0.5711781383, alpha: 1), for: .normal)
        btnEnquiryForm.setTitleColor(#colorLiteral(red: 0, green: 0.3403271139, blue: 0.5711781383, alpha: 1), for: .normal)
        review = (self.storyboard?.instantiateViewController(withIdentifier: "KGReviewViewController") as? KGReviewViewController)!
        
        self.addChild(review!)
        
        review?.view.frame = self.containerView.bounds
        containerView.addSubview((review?.view)!)
        review?.didMove(toParent: self)
        
        
    }
    
    
    @IBAction func actionDescription(_ sender: UIButton) {
        if subDesVc != nil{
            subDesVc?.view.removeFromSuperview()
        }
        if subKrsVC != nil{
            subKrsVC?.view.removeFromSuperview()
        }
        if enquiry != nil{
            enquiry?.view.removeFromSuperview()
        }
        if review != nil{
            review?.view.removeFromSuperview()
        }
        viewEnquiryForm.backgroundColor = #colorLiteral(red: 0.9200000167, green: 0.9200000167, blue: 0.9200000167, alpha: 1)
        viewReview.backgroundColor = #colorLiteral(red: 0.9200000167, green: 0.9200000167, blue: 0.9200000167, alpha: 1)
        viewDescription.backgroundColor = #colorLiteral(red: 1, green: 0.5843137255, blue: 0, alpha: 1)
        btnDescription.setTitleColor(.orange, for: .normal)
        btnReview.setTitleColor(#colorLiteral(red: 0, green: 0.3403271139, blue: 0.5711781383, alpha: 1), for: .normal)
        btnEnquiryForm.setTitleColor(#colorLiteral(red: 0, green: 0.3403271139, blue: 0.5711781383, alpha: 1), for: .normal)
        if desSubTitle.text != "By Klean Rite"{
            subDesVc = (self.storyboard?.instantiateViewController(withIdentifier: "KGSubDescriptionViewController") as? KGSubDescriptionViewController)!
            subDesVc?.descriptionString = desString
            self.addChild(subDesVc!)
            subDesVc?.view.frame = self.containerView.bounds
            containerView.addSubview((subDesVc?.view)!)
            subDesVc?.didMove(toParent: self)
        }else{
            subKrsVC = (self.storyboard?.instantiateViewController(withIdentifier: "KGKleanSubDescriptionTableViewController") as? KGKleanSubDescriptionTableViewController)!
            subKrsVC?.descriptionNsAttributedString = desKrsString
            self.addChild(subKrsVC!)
            subKrsVC?.view.frame = self.containerView.bounds
            containerView.addSubview((subKrsVC?.view)!)
            subKrsVC?.didMove(toParent: self)
        }
    }
    @IBAction func actionEnquiry(_ sender: UIButton) {
        if subDesVc != nil{
            subDesVc?.view.removeFromSuperview()
        }
        if enquiry != nil{
            enquiry?.view.removeFromSuperview()
        }
        if subKrsVC != nil{
            subKrsVC?.view.removeFromSuperview()
        }
        if review != nil{
            review?.view.removeFromSuperview()
        }
        viewDescription.backgroundColor = #colorLiteral(red: 0.9200000167, green: 0.9200000167, blue: 0.9200000167, alpha: 1)
        viewReview.backgroundColor = #colorLiteral(red: 0.9200000167, green: 0.9200000167, blue: 0.9200000167, alpha: 1)
        viewEnquiryForm.backgroundColor = #colorLiteral(red: 1, green: 0.5843137255, blue: 0, alpha: 1)
        btnEnquiryForm.setTitleColor(.orange, for: .normal)
        btnReview.setTitleColor(#colorLiteral(red: 0, green: 0.3403271139, blue: 0.5711781383, alpha: 1), for: .normal)
        btnDescription.setTitleColor(#colorLiteral(red: 0, green: 0.3403271139, blue: 0.5711781383, alpha: 1), for: .normal)
        enquiry = (self.storyboard?.instantiateViewController(withIdentifier: "KGEnquiryFormViewController") as? KGEnquiryFormViewController)!
        
        self.addChild(enquiry!)
        
        enquiry?.view.frame = self.containerView.bounds
        containerView.addSubview((enquiry?.view)!)
        enquiry?.didMove(toParent: self)
    }
}
