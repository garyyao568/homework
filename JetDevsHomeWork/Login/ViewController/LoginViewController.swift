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

        setupEmailTF()
        setupPasswordTF()
        setupLoginButton()
    }
    
    @IBAction func closeButtonTap(_ sender: AnyObject) {
        self.dismiss(animated: true)
    }
    
    private func setupEmailTF() {
        emailTF.setTextFieldLabel(with: "Email")
        emailTF.setTextField(placeholder: "Email",
                             keyboardType: .emailAddress)
    }
    
    private func setupPasswordTF() {
        passwordTF.setTextFieldLabel(with: "Password")
        passwordTF.setTextField(placeholder: "Password",
                                returnKeyType: .done,
                                secureEntry: true)
    }
    
    private func setupLoginButton() {
        loginButton.initUI()
        loginButton.isButtonEnabled = true
    }
}
