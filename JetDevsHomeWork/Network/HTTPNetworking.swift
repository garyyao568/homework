//
//  HTTPNetworking.swift
//  JetDevsHomeWork
//
//  Created by Anand Prakash on 03/02/24.
//

import Foundation

/// This struct handles the creation and execution of network requests, processing the responses,
/// and returning either the fetched data and response or an error through a completion handler.

struct HTTPNetworking: Networking {
    
    private struct UnexpectedValuesRepresentation: Error {}
    
    func request(from: Endpoint, completion: @escaping (Networking.Result) -> Void) {
        
        let request = from.request
        
        let task = createDataTask(from: request, completion: completion)
        task.resume()
    }
    
    /// Creates a `URLSessionDataTask` with the given request, handling completion and errors.
    private func createDataTask(from request: URLRequest,
                                completion: @escaping (Networking.Result) -> Void) -> URLSessionDataTask {
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in

            completion(Result {
                if let error = error {
                    throw error
                } else if let data = data, let response = response as? HTTPURLResponse {
                    return (data, response)
                } else {
                    throw UnexpectedValuesRepresentation()
                }
            })
        }
        
        return task
    }
}
