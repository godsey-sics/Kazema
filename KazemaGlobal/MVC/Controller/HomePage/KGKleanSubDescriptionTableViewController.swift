//
//  KGKleanSubDescriptionTableViewController.swift
//  KazemaGlobal
//
//  Created by Srishti on 12/11/20.
//  Copyright © 2020 Chitra S R. All rights reserved.
//

import UIKit

class KGKleanSubDescriptionTableViewController: UITableViewController {
     @IBOutlet weak var descriptionTextView: UITextView!
    var descriptionNsAttributedString : NSAttributedString?
       override func viewDidLoad() {
           super.viewDidLoad()
           descriptionTextView.attributedText = descriptionNsAttributedString
       }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

 
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            var txtHeight = 0
            if (descriptionTextView.text.count) == 235 {
                
                return 170
                
            }else if (descriptionTextView.text.count) == 160 {
                
                return 150
            }else if (descriptionTextView.text.count) == 90 {
                
                return 100
            }else if (descriptionTextView.text.count) == 294 {
                
                return 300
            }else if (descriptionTextView.text.count) == 367 {
                
                return 250
            }else{
                txtHeight = Int(("\(String(describing: descriptionNsAttributedString))".heightForView(font: UIFont.systemFont(ofSize: 14), width: self.view.frame.width - 50)))
                return CGFloat(txtHeight)
            }
            
        }else if indexPath.row == 1{
            if (descriptionTextView.text.count) == 235 {
                return  super.tableView(tableView, heightForRowAt: indexPath)
            }else{
                return 0
            }
        }else {
            return 60
        }
    }
    

    @IBAction func registerButtonAction(_ sender: CustomButton) {
        let maintenancePageVC = self.storyboard?.instantiateViewController(withIdentifier: "KGPhoneNumberViewController") as!  KGPhoneNumberViewController
        self.navigationController?.pushViewController(maintenancePageVC, animated: true)
    }
}
extension String {
    
    public func range(ofText text: String) -> NSRange {
        let fullText = self
        let range = (fullText as NSString).range(of: text)
        return range
    }
    func heightForView(font:UIFont, width:CGFloat) -> CGFloat {
        let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = font
        label.text = self
        label.sizeToFit()
        
        return label.frame.height
    }
    
  
}
