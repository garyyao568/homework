//
//  Date.swift
//  JetDevsHomeWork
//
//  Created by Anand Prakash on 03/02/24.
//

import Foundation

extension Date {
    
    func toString(format: String = "dd MMM YYYY") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = .current
        dateFormatter.dateFormat = format
        
        return dateFormatter.string(from: self)
    }
    
    func getDaysDiff(from: Date) -> Int {
        let timeComponents = Calendar.current.dateComponents([.day, .hour, .minute], from: from, to: self)
        
        return (timeComponents.day ?? 0)
    }
}
