//
//  UIStoryboard+JetDevs.swift
//  JetDevsHomeWork
//
//  Created by Shibili Areekara on 12/12/22.
//

import UIKit
extension UIStoryboard {
    
    static func loginScreen(hideBottomBar: Bool = true) -> UIViewController? {
        let storyboardID = String(String(describing: LoginViewController.self))
        let loginStoryboard = UIStoryboard(name: storyboardID, bundle: nil)
        
        guard let loginVC = loginStoryboard.instantiateViewController(withIdentifier: storyboardID) as? LoginViewController
        else {
            return nil
        }
        
        loginVC.hidesBottomBarWhenPushed = true
        return loginVC
    }
}
