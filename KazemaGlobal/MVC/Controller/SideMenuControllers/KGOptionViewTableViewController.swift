//
//  KGOptionViewTableViewController.swift
//  KazemaGlobal
//
//  Created by Srishti on 17/11/20.
//  Copyright © 2020 Chitra S R. All rights reserved.
//

import UIKit

class KGOptionViewTableViewController: UITableViewController {
    @IBOutlet weak var mainTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let myMutableString = NSMutableAttributedString(string: mainTitle.text!, attributes: [NSAttributedString.Key.font :UIFont(name: "poppins", size: 18.0)!])
        myMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.orange, range: NSRange(location:0,length:7))
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return  super.tableView(tableView, heightForRowAt: indexPath)
    }

}
