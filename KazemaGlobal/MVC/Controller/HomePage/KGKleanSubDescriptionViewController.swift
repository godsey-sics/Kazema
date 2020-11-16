//
//  KGKleanSubDescriptionViewController.swift
//  KazemaGlobal
//
//  Created by Srishti on 12/11/20.
//  Copyright © 2020 Chitra S R. All rights reserved.
//

import UIKit

class KGKleanSubDescriptionViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var descriptionTextView: UITextView!
    var descriptionNsAttributedString : NSAttributedString?
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionTextView.attributedText = descriptionNsAttributedString
    }
    
}
