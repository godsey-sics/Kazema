//
//  Extensions.swift
//  KazemaGlobal
//
//  Created by Srishti on 06/11/20.
//  Copyright © 2020 Chitra S R. All rights reserved.
//

import Foundation
import UIKit

extension UILabel{
    func addBottomBorder(color: UIColor){
         let border = CALayer()
         let width = CGFloat(1.0)
         border.borderColor = color.cgColor
         border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width, height: self.frame.size.height)
         
         border.borderWidth = width
         self.layer.addSublayer(border)
         self.layer.masksToBounds = true
     }
}
extension UIView{
    func addBottomBorder(with color: UIColor?, andWidth borderWidth: CGFloat) {
           let border = UIView()
           border.backgroundColor = color
           border.autoresizingMask = [.flexibleWidth, .flexibleTopMargin]
           border.frame = CGRect(x: 0, y: frame.size.height - borderWidth, width: frame.size.width, height: borderWidth)
           addSubview(border)
       }
}
extension UITextField {
    
    func setPaddingViewWithImage(image : UIImage) {
        
        let paddingView = UIButton(frame: CGRect(x: 10, y: 0, width: 40, height: 40))
        paddingView.setImage(image, for: .normal)
        self.leftView = paddingView
        self.leftViewMode = .always
        
    }
}
