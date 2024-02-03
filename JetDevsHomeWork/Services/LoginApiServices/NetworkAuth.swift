//
//  NetworkAuth.swift
//  JetDevsHomeWork
//
//  Created by Anand Prakash on 03/02/24.
//

import Foundation
enum NetworkAuth {
    
    case login(params: AuthenticationParameters)
}

extension NetworkAuth: Endpoint {
    
    var base: String {
        return APIConstants.baseURL
    }
    
    var path: String {
        switch self {
        case .login:
            return APIConstants.Paths.login
        }
    }
    
    var headers: [String: String]? {
        switch self {
        case .login:
            return nil
        }
    }
    
    var params: [String: Any]? {
        switch self {
        case let .login(params):
            return getLoginParams(from: params)
        }
    }
    
    var parameterEncoding: ParameterEnconding {
        switch self {
        case .login:
            return .jsonEncoding
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .login:
            return .post
        }
    }
    
    private func getLoginParams(from params: AuthenticationParameters) -> [String: Any] {
        return ["email": params.email, "password": params.password]
    }
}
