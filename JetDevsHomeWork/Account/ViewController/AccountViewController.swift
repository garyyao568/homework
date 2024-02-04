//
//  AccountViewController.swift
//  JetDevsHomeWork
//
//  Created by Gary.yao on 2021/10/29.
//

import UIKit
import Kingfisher
import RxSwift

class AccountViewController: UIViewController {

	@IBOutlet weak var nonLoginView: UIView!
	@IBOutlet weak var loginView: UIView!
	@IBOutlet weak var daysLabel: UILabel!
	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var headImageView: UIImageView!
    
    var viewModel = AccountsViewModel()

	override func viewDidLoad() {
        super.viewDidLoad()

		self.navigationController?.navigationBar.isHidden = true
        // Do any additional setup after loading the view.
		nonLoginView.isHidden = false
		loginView.isHidden = true
    }
	
	@IBAction func loginButtonTap(_ sender: UIButton) {
        if let loginVC = UIStoryboard.loginScreen() {
            navigationController?.present(loginVC, animated: true)
        }
	}
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        initView()
    }
    
    private func initView() {
        viewModel.loadUser { [weak self] user in
            guard let self = self else {
                return
            }
            
            if let user = user {
                self.show(login: false)
                self.loadUserData(user: user)
            } else {
                self.show(login: true)
            }
        }
    }
    
    private func loadUserData(user: UserLocalData) {
        nameLabel.text = user.name
        daysLabel.text = viewModel.getNumberOfDays(from: user.createdAt)
        
        if !user.profileURL.isEmpty,
           let url = URL(string: user.profileURL) {
            let placeholder = UIImage(named: "Avatar")
            headImageView.kf.setImage(with: url, placeholder: placeholder)
        }
    }
    
    private func show(login: Bool) {
        nonLoginView.isHidden = !login
        loginView.isHidden = login
    }
	
}
