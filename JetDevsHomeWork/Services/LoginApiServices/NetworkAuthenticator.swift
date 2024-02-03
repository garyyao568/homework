//
//  NetworkAuthenticator.swift
//  JetDevsHomeWork
//
//  Created by Anand Prakash on 03/02/24.
//

import Foundation

/// A class responsible for performing authentication-related network requests.
final class NetworkAuthenticator: Authenticator {
    
    private let networking: Networking
    
    public enum Error: Swift.Error {
        case connectivity
        case invalidData
    }
    
    typealias Result = Authenticator.AuthenticationResult
    
    init(networking: Networking) {
        self.networking = networking
    }
    
    func login(with params: AuthenticationParameters, completion: @escaping (Result) -> Void) {
        networking.request(from: NetworkAuth.login(params: params)) { [weak self] result in
            guard self != nil
            else {
                return
            }
            
            switch result {
            case let .success((data, response)):
                completion(NetworkAuthenticator.map(data, from: response))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
    
    private static func map(_ data: Data, from response: HTTPURLResponse) -> Result {
        do {
            let dataModel = try NetworkLoginDataMapper.map(data, from: response)
            let featureModel = try dataModel.toUserModel()
            return .success(featureModel)
        } catch {
            return .failure(error)
        }
    }
}

private extension NetworkLoginData {
    
    func toUserModel() throws -> UserData {
        guard errorMessage.isEmpty,
              let user = data?.user
        else {
            throw NSError(domain: "API Error", code: 401, userInfo: [
                NSLocalizedDescriptionKey: errorMessage
            ])
        }
        
        return user.toModel()
    }
}

private extension NetworkLoginDataUser {
    
    func toModel() -> UserData {
        return UserData(userID: userId,
                      name: userName,
                      profileURL: userProfileUrl,
                      createdAt: createdAt)
    }
}
