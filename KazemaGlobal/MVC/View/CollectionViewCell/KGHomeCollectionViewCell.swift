//
//  KGHomeCollectionViewCell.swift
//  KazemaGlobal
//
//  Created by Srishti on 06/11/20.
//  Copyright © 2020 Chitra S R. All rights reserved.
//

import UIKit

class KGHomeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var sliderImageView: UIImageView!
    override func awakeFromNib() {
       super.awakeFromNib()
    }
}


class KGKazemaMaintenanceServiceCollectionViewCell:UICollectionViewCell {
    @IBOutlet weak var kmswllImageView: UIImageView!
    @IBOutlet weak var kmswllDescription: UILabel!
    @IBOutlet weak var kmswllType: UILabel!
    @IBOutlet weak var kmswllTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        kmswllType.addBottomBorder(color: .lightGray)
    }
}

class KGKleanRiteServiceCollectionViewCell:UICollectionViewCell {
    @IBOutlet weak var krsImageView: UIImageView!
    @IBOutlet weak var krsDescription: UILabel!
    @IBOutlet weak var krsType: UILabel!
    @IBOutlet weak var krsTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        krsType.addBottomBorder(color: .lightGray)
    }
}
