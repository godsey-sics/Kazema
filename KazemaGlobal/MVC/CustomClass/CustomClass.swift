//
//  CustomImageView.swift
//  KazemaGlobal
//
//  Created by Srishti on 06/11/20.
//  Copyright © 2020 Chitra S R. All rights reserved.
//

import Foundation
import UIKit
class CustomImageView : UIImageView
{
    @IBInspectable var borderColor: UIColor = UIColor.clear{
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    @IBInspectable var borderWidth: CGFloat = 0
        {
        didSet
        {
            layer.borderWidth = borderWidth
        }
    }
    @IBInspectable var cornerRadius: CGFloat = 0
        {
        didSet
        {
            layer.cornerRadius = cornerRadius
        }
    }
}


class CustomTextView :UITextView{
    @IBInspectable var cornerRadius: CGFloat = 0
        {
        didSet
        {
            layer.cornerRadius = cornerRadius
        }
    }
    @IBInspectable var borderWidth: CGFloat = 0
        {
        didSet
        {
            layer.borderWidth = borderWidth
        }
    }
    @IBInspectable var borderColor: UIColor = UIColor.clear
        {
        didSet
        {
            layer.borderColor = borderColor.cgColor
        }
    }
}


class CustomButton :UIButton{
     var label: UILabel!
    @IBInspectable var borderWidth: CGFloat = 0
           {
           didSet
           {
               layer.borderWidth = borderWidth
           }
       }
       @IBInspectable var cornerRadius: CGFloat = 0
           {
           didSet
           {
               layer.cornerRadius = cornerRadius
           }
       }
       @IBInspectable var textfontSize: CGFloat = 20{
            didSet {
                label.font = UIFont.systemFont(ofSize: textfontSize)
            }
        }
        @IBInspectable var numberOfLines: Int = 2{
            didSet {
                label.numberOfLines = numberOfLines
            }
        }
        @IBInspectable var boldTitle: Bool = false{
            didSet {
                if boldTitle
                {
                    label.font =  UIFont.systemFont(ofSize: textfontSize, weight: .bold)
    //                    UIFont(name: "Arial-BoldMT", size: textfontSize)
                }
            }
        }
        
        @IBInspectable var titleColor: UIColor!{
            didSet {
                label.textColor =  titleColor
            }
        }
        
        @IBInspectable var selectedTitleColor: UIColor!{
            didSet {
                if isSelected
                {
                label.textColor =  selectedTitleColor
                }
            }
        }
}


class CustomView : UIView
{
    @IBInspectable var borderColor: UIColor = UIColor.clear{
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    @IBInspectable var borderWidth: CGFloat = 0
        {
        didSet
        {
            layer.borderWidth = borderWidth
        }
    }
    @IBInspectable var setTopCorners : Bool = false
        {
        didSet {
        }
        
    }
    @IBInspectable var cornerRadius: CGFloat = 0
        {
        didSet
        {
            layer.cornerRadius = cornerRadius
            clipsToBounds = true
        }
    }
    override func draw(_ rect: CGRect) {
        setBorders()
    }
    func setBorders()
    {
        if self.setTopCorners == true
        {
            let topPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.topLeft,.topRight],
                                       cornerRadii: CGSize(width: 20.0, height: 20.0))
            //            topPath.lineWidth = 5.0
            let layer = CAShapeLayer()
            layer.frame = self.bounds
            layer.path = topPath.cgPath
            self.layer.masksToBounds = true
            self.layer.mask = layer
            self.clipsToBounds = true
            let topBorder = CAShapeLayer()
            topBorder.frame = self.bounds
            topBorder.strokeColor =  self.borderColor.cgColor
            topBorder.fillColor = UIColor.clear.cgColor
            topBorder.path = layer.path
            topBorder.lineWidth = 2.0
            self.layer.addSublayer(topBorder)
            
        }
        
        
    }
}
class CustomTextField: UITextField {
    var padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    
    @IBInspectable var paddingWidth : CGFloat = 0 {
        didSet {
            padding  = UIEdgeInsets(top: 0, left: paddingWidth, bottom: 0, right: paddingWidth);
            
        }
    }
    
    @IBInspectable var placeHolderColor : UIColor = UIColor.black {
        didSet {
            self.setValue(placeHolderColor, forKeyPath: "_placeholderLabel.textColor")
            
        }
    }
    @IBInspectable var rightImage: UIImage = UIImage(){
        didSet {
            self.rightViewMode = .always
            let imgView = UIImageView(image: rightImage)
            imgView.contentMode = .scaleAspectFit
            //            imgView.frame = CGRect(x: 10, y: self.frame.width - (imgView.frame.width + 5) , width: imgView.frame.width, height: imgView.frame.height)
            self.rightView = imgView
            
        }
    }
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x:self.frame.width - ((rightView?.frame.width)! + 5), y:  (self.frame.height -  (rightView?.frame.height)!) / 2 , width: (rightView?.frame.width)!, height:  (rightView?.frame.height)!)
    }
    
    override func draw(_ rect: CGRect) {
        setBorders()
    }
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    @IBInspectable var borderColor: UIColor = UIColor.clear{
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    @IBInspectable var borderWidth: CGFloat = 0
        {
        didSet
        {
            layer.borderWidth = borderWidth
        }
    }
    
    func setBorders()
    {
        if leftBorder == true
        {
            let leftBorder = CAShapeLayer()
            self.layoutSubviews()
            leftBorder.frame = CGRect(x: 0, y: 0, width: 1.0, height: self.frame.height)
            leftBorder.backgroundColor = self.borderColor.cgColor
            leftBorder.strokeColor =  self.borderColor.cgColor
            self.layer.addSublayer(leftBorder)
            
            
        }
        if rightBorder == true
        {
            let rightBorder = CAShapeLayer()
            self.layoutSubviews()
            rightBorder.frame = CGRect(x: self.frame.width - 1, y: 0, width: 1.0, height: self.frame.height)
            rightBorder.backgroundColor = self.borderColor.cgColor
            rightBorder.strokeColor =  self.borderColor.cgColor
            self.layer.addSublayer(rightBorder)
            
        }
        
        if topBorder == true
        {
            
        }
        
        if bottomBorder == true
        {
            let bottomBorder = CAShapeLayer()
            self.layoutSubviews()
            bottomBorder.frame = CGRect(x: 0, y: self.frame.maxY - 1, width: self.frame.width, height: 1.0)
            bottomBorder.backgroundColor = self.borderColor.cgColor
            bottomBorder.strokeColor =  self.borderColor.cgColor
            self.layer.addSublayer(bottomBorder)
            
        }
        
        if self.setTopCorners == true
        {
            let topPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.topLeft,.topRight],
                                       cornerRadii: CGSize(width: 5.0, height: 5.0))
            //            topPath.lineWidth = 5.0
            let layer = CAShapeLayer()
            layer.frame = self.bounds
            layer.path = topPath.cgPath
            self.layer.masksToBounds = true
            self.layer.mask = layer
            self.clipsToBounds = true
            let topBorder = CAShapeLayer()
            topBorder.frame = self.bounds
            topBorder.strokeColor =  self.borderColor.cgColor
            topBorder.fillColor = UIColor.clear.cgColor
            topBorder.path = layer.path
            topBorder.lineWidth = 2.0
            self.layer.addSublayer(topBorder)
            
        }
        if setBottomCorners == true
        {
            let bottomPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.bottomLeft,.bottomRight
            ], cornerRadii: CGSize(width: 5.0, height: 5.0))
            //            bottomPath.lineWidth = 5.0
            let layer = CAShapeLayer()
            layer.frame = self.bounds
            layer.path = bottomPath.cgPath
            self.layer.masksToBounds = true
            self.layer.mask = layer
            self.clipsToBounds = true
            let bottomBorder = CAShapeLayer()
            bottomBorder.frame = self.bounds
            bottomBorder.strokeColor =  self.borderColor.cgColor
            bottomBorder.fillColor = UIColor.clear.cgColor
            bottomBorder.path = layer.path
            bottomBorder.lineWidth = 2.0
            
            self.layer.addSublayer(bottomBorder)
        }
        
    }
    
    @IBInspectable var setTopCorners : Bool = false
        {
        didSet {
        }
        
    }
    @IBInspectable var setBottomCorners : Bool = false
        {
        didSet {
        }
        
    }
    
    @IBInspectable var leftBorder : Bool = false
        {
        didSet{
            
        }
    }
    @IBInspectable var rightBorder : Bool = false
        {
        didSet{
            
            
        }
    }
    @IBInspectable var bottomBorder : Bool = false
        {
        didSet{
            
        }
    }
    @IBInspectable var topBorder : Bool = false
        {
        didSet{
            
        }
    }
    
    
}

