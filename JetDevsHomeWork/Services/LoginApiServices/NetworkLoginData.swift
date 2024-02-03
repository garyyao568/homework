//
//  NetworkLoginData.swift
//  JetDevsHomeWork
//
//  Created by Anand Prakash on 03/02/24.
//

import Foundation
struct NetworkLoginData: Decodable {
    
    let errorMessage: String
    let data: NetworkLoginDataa?
}

struct NetworkLoginDataa: Decodable {
    
    let user: NetworkLoginDataUser?
}

struct NetworkLoginDataUser: Decodable {
    
    let userId: Int
    let userName: String
    let userProfileUrl: String
    let createdAt: String
}
