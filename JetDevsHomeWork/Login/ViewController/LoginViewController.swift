//
//  LoginViewController.swift
//  JetDevsHomeWork
//
//  Created by Shibili Areekara on 12/12/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet private(set) weak var emailTF: JDTextField!
    @IBOutlet private(set) weak var passwordTF: JDTextField!
    @IBOutlet private(set) weak var loginButton: JDButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpLoginButton()
    }
    
    @IBAction func closeButtonTap(_ sender: AnyObject) {
        self.dismiss(animated: true)
    }
    
    private func setUpLoginButton() {
        loginButton.initUI()
        loginButton.isButtonEnabled = false
    }
}
