//
//  LoginViewController.swift
//  JetDevsHomeWork
//
//  Created by Anand Prakash on 03/02/24.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTxtField: JDTextField!
    
    @IBOutlet weak var passwordTxtField: JDTextField!
    @IBOutlet weak var loginButton: JDButton!
    
    var loaderView: UIActivityIndicatorView!
    var viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUIElements()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Action button
    @IBAction func loginButtonTap(_ sender: AnyObject) {
        
    }
    @IBAction func closeButtonTap(_ sender: AnyObject) {
        self.dismiss(animated: true)
    }
   
    private func setupUIElements() {
        setupemailTxtField()
        setuppasswordTxtField()
        setupLoginButton()
        setIndicatorView()
    }
    private func setupemailTxtField() {
        emailTxtField.setTextFieldLabel(with: "Email")
        emailTxtField.setTextField(placeholder: "Email",
                             keyboardType: .emailAddress)
        
        emailTxtField.textFieldDidChange = setEmail(with:)
        emailTxtField.textFieldShouldReturn = dismissKeyBoard
    }
    
    private func setuppasswordTxtField() {
        passwordTxtField.setTextFieldLabel(with: "Password")
        passwordTxtField.setTextField(placeholder: "Password",
                                secureEntry: true)
        
        passwordTxtField.textFieldDidChange = setPassword(with:)
        passwordTxtField.textFieldShouldReturn = dismissKeyBoard
    }
    
    private func setupLoginButton() {
        loginButton.initUI()
        hanldeLoginButton()
    }
    
    private func hanldeLoginButton() {
        loginButton.isButtonEnabled = viewModel.isValid
    }
    
    private func setEmail(with text: String) {
        viewModel.setEmail(with: text)
        hanldeLoginButton()
    }
    
    private func setPassword(with text: String) {
        viewModel.setPassword(with: text)
        hanldeLoginButton()
    }
    
    private func setIndicatorView() {
        loaderView = UIActivityIndicatorView.activityIndicator(center: self.view.center)
        self.view.addSubview(loaderView)
    }
    
    private func startLoading() {
        loaderView.startAnimating()
        view.isUserInteractionEnabled = false
    }
    
    private func stopLoading() {
        loaderView.stopAnimating()
        view.isUserInteractionEnabled = true
    }
    
    private func dismissKeyBoard() {
        view.endEditing(true)
    }

}
