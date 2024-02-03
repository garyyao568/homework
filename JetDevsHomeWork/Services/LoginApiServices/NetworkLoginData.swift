//
//  NetworkLoginData.swift
//  JetDevsHomeWork
//
//  Created by Anand Prakash on 03/02/24.
//

import Foundation
struct NetworkLoginData: Decodable {
    
    let error_message: String
    let data: NetworkLoginDataa?
}

struct NetworkLoginDataa: Decodable {
    
    let user: NetworkLoginDataUser?
}

struct NetworkLoginDataUser: Decodable {
    
    let user_id: Int
    let user_name: String
    let user_profile_url: String
    let created_at: String

}
