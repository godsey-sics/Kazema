//
//  KGPhoneNumberViewController.swift
//  KazemaGlobal
//
//  Created by Srishti on 16/11/20.
//  Copyright © 2020 Chitra S R. All rights reserved.
//

import UIKit

class KGPhoneNumberViewController: UIViewController,UITextFieldDelegate {
 var lblCountryCode:UILabel!
   
    @IBOutlet weak var phnTextField: CustomTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        let padding4 = UIView(frame:CGRect(x: 0,y: 0, width: 40, height: 43))
        padding4.layer.cornerRadius = 2.0
        lblCountryCode = UILabel(frame: CGRect(x: 0, y: 0, width: 40, height: 43))
        lblCountryCode.layer.cornerRadius = 2.0
        lblCountryCode.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        lblCountryCode.layer.borderWidth = 1.0
        lblCountryCode.center = padding4.center
        lblCountryCode.textAlignment = .center
        lblCountryCode.textColor = UIColor.clear
        let tapOnLabel = UITapGestureRecognizer(target: self, action: #selector(self.tapOnLabelAction))
        lblCountryCode.addGestureRecognizer(tapOnLabel)
        lblCountryCode.isUserInteractionEnabled = true
        lblCountryCode.text = (Locale.current as NSLocale).object(forKey: NSLocale.Key.countryCode) as? String
        padding4.addSubview(lblCountryCode)
        phnTextField.leftView = padding4
        phnTextField.leftViewMode = .always
        phnTextField.delegate = self
        // Do any additional setup after loading the view.
    }
    
    @objc func tapOnLabelAction(){
        
    }
    

}
