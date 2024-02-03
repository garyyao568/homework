//
//  Networking.swift
//  JetDevsHomeWork
//
//  Created by Anand Prakash on 03/02/24.
//

import Foundation

/// Represents a networking service capable of performing requests defined by an `Endpoint`.
///
/// This protocol abstracts the details of network communication, allowing for different
/// implementations that can handle requests and return data asynchronously.

protocol Networking {
    
  typealias Result = Swift.Result<(Data, HTTPURLResponse), Error>
    
  func request(from: Endpoint, completion: @escaping (Result) -> Void)
}
