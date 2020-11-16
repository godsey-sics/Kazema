//
//  KGSubDescriptionViewController.swift
//  KazemaGlobal
//
//  Created by Srishti on 11/11/20.
//  Copyright © 2020 Chitra S R. All rights reserved.
//

import UIKit

class KGSubDescriptionViewController: UIViewController {
    
    @IBOutlet weak var descriptionTextView: UITextView!
    var descriptionString : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionTextView.text = descriptionString
    }
    
}
