//
//  String+Date.swift
//  JetDevsHomeWork
//
//  Created by Anand Prakash on 03/02/24.
//

import Foundation

extension String {
    
    /// Converts a string to a `Date` object using the specified date format.
    /// - Parameter format: A `String` representing the date format to use for parsing. Defaults to ISO 8601 format.
    /// - Returns: An optional `Date` object. Returns `nil` if the string cannot be parsed using the specified format.
    ///
    /// The function is designed to parse date strings effectively, especially those in ISO 8601 format. It sets the
    /// Locale to "en_US_POSIX" to handle fixed-format date strings universally, regardless of the user's locale settings.
    /// The time zone is set to UTC ('Z') by default to align with the common use of ISO 8601 in network communications
    /// Where UTC time is standard. If parsing dates not in UTC, adjust the `timeZone` parameter accordingly.

    func toDate(format: String = "yyyy'-'MM'-'dd'T'HH':'mm':'ss.SSS'Z'") -> Date? {
        let dateFormatter = DateFormatter()
        // Use POSIX locale for fixed-format parsing
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = .current
        dateFormatter.dateFormat = format
        
        return dateFormatter.date(from: self)
    }
}
