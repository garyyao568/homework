//
//  UIActivityIndicator.swift
//  JetDevsHomeWork
//
//  Created by Anand Prakash on 03/02/24.
//

import UIKit

extension UIActivityIndicatorView {
    
    static func activityIndicator(frame: CGRect? = nil,
                                  center: CGPoint? = nil) -> UIActivityIndicatorView {
       
        let activityIndicatorView = UIActivityIndicatorView()

        if let frame = frame {
            activityIndicatorView.frame = frame
        }
        
        if let center = center {
            activityIndicatorView.center = center
        }
        
        return activityIndicatorView
    }
}
