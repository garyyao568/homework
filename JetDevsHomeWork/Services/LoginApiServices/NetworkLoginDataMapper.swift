//
//  NetworkLoginDataMapper.swift
//  JetDevsHomeWork
//
//  Created by Anand Prakash on 03/02/24.
//

import Foundation
final class NetworkLoginDataMapper {
    
    static func map(_ data: Data, from response: HTTPURLResponse) throws -> NetworkLoginData {
        
        guard response.isOK else {
            throw NetworkAuthenticator.Error.invalidData
        }
        
        do {
          let model = try JSONDecoder().decode(NetworkLoginData.self, from: data)
            return model
        } catch {
            throw error
        }
    }
    
}
