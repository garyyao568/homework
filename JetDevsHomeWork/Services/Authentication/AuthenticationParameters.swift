//
//  AuthenticationParameters.swift
//  JetDevsHomeWork
//
//  Created by Anand Prakash on 03/02/24.
//

import Foundation
struct AuthenticationParameters {
    let email: String
    let password: String
}


/// This protocol outlines the functionalities an authenticator should provide,
/// primarily focusing on the login capability using `AuthenticationParameters`.
protocol Authenticator {
    /// Represents the result of an authentication attempt.

       /// This typealias enhances readability by specifying whether the authentication
       /// was successful (`UserData`) or resulted in an error (`Error`).
       typealias AuthenticationResult = Swift.Result<UserData, Error>
       
       /// - Parameters:
       ///   - parameters: The `AuthenticationParameters` containing the user's email and password.
       ///   - completion: A completion handler that is called with the `AuthenticationResult`.
       ///                 This result can either be a success with a `UserData` instance or a failure with an `Error`.
    func login(with parameters: AuthenticationParameters, completion: @escaping (AuthenticationResult) -> Void)
}
