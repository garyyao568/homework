//
//  HTTPURLResponse+StatusCode.swift
//  JetDevsHomeWork
//
//  Created by Anand Prakash on 03/02/24.
//

import Foundation

extension HTTPURLResponse {
    
    private static var OK200: Int { return 200 }
    
    var isOK: Bool {
        return statusCode == HTTPURLResponse.OK200
    }
}
