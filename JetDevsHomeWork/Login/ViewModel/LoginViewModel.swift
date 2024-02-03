//
//  LoginViewModel.swift
//  JetDevsHomeWork
//
//  Created by Anand Prakash on 03/02/24.
//

import Foundation

class LoginViewModel {
    
  
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
