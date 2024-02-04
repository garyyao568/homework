//
//  AccountViewModel.swift
//  JetDevsHomeWork
//
//  Created by Anand Prakash on 03/02/24.
//

import Foundation

class AccountsViewModel {
    
    func loadUser(completion: @escaping (UserLocalData?) -> Void) {
        if let data = UserDefaults.standard.data(forKey: "user") {
            do {
                let decoder = JSONDecoder()
                let user = try decoder.decode(UserLocalData.self, from: data)
                
                completion(user)
            } catch {
                completion(nil)
            }
        } else {
            completion(nil)
        }
    }
    
    func getNumberOfDays(from date: String) -> String {
        guard let date = date.toDate() else {
            return "Created 0 days ago"
        }
        
        let daysDiff = abs(date.getDaysDiff(from: Date()))
        
        return "Created \(daysDiff) days ago"
    }
}
