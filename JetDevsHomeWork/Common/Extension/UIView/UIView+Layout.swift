//
//  UIView+Layout.swift
//  JetDevsHomeWork
//
//  Created by Anand Prakash on 03/02/24.
//

import UIKit

extension UIView {
    
    @IBInspectable var corner: CGFloat {
        get {
            return layer.cornerRadius
        }
        
        set {
            layer.cornerRadius = newValue
            clipsToBounds = true
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        
        set {
            layer.borderWidth = newValue
            clipsToBounds = true
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor.clear
        }
        
        set {
            layer.borderColor = newValue?.cgColor
            layer.borderWidth = 1.0
        }
    }
}
