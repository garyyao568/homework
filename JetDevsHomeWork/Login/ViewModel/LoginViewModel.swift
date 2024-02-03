//
//  LoginViewModel.swift
//  JetDevsHomeWork
//
//  Created by Anand Prakash on 03/02/24.
//

import Foundation
import RxSwift

class LoginViewModel {
    
    let authenticator: Authenticator
    
    init(authenticator: Authenticator) {
        self.authenticator = authenticator
    }
    private var email = ""
    private var password = ""
    
    func setEmail(with text: String) {
        email = text
    }
    
    func setPassword(with text: String) {
        password = text
    }
    
    var isValid: Bool {
        return (email.isValidEmail && password.isValidPassword)
    }
    
    func authUser(completion: @escaping (Error?) -> Void) {
        let params = AuthenticationParameters(email: email,
                                           password: password)
        
        authenticator.login(params: params) { [weak self] result in
            guard let self = self else {
                return
            }

            switch result {
            case let .success(user):
                self.saveUserData(user: user)
                completion(nil)
            case let .failure(error):
                completion(error)
            }
        }
    }
    
    func saveUserData(user: UserData) {
        let localUser = user.toLocalModel()
        
        let encoder = JSONEncoder()
        let data = try? encoder.encode(localUser)
        
        UserDefaults.standard.set(data, forKey: "user")
    }
}

private extension UserData {
    
    func toLocalModel() -> UserLocalData {
        return UserLocalData(userID: userID,
                             name: name,
                             profileURL: profileURL,
                             createdAt: createdAt)
    }
}
