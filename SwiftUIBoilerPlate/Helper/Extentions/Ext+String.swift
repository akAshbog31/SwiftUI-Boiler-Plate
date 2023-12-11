//
//  Ext+String.swift
//  SwiftUIDemo
//
//  Created by iOS Developer on 11/12/23.
//

import Foundation

import UIKit

extension String {
    func toDate(_ format: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Locale.current
        return dateFormatter.date(from: self) ?? Date()
    }
}

//MARK: - Validations
extension String {
    //MARK: - isBlank
    var isBlank: Bool {
        get {
            let trimmed = trimmingCharacters(in: CharacterSet.whitespaces)
            return trimmed.isEmpty
        }
    }
    
    //MARK: - isEmail
    var isEmail: Bool {
        do {
            let regex = try NSRegularExpression(pattern: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}", options: .caseInsensitive)
            return regex.firstMatch(in: self, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, self.count)) != nil
        } catch {
            return false
        }
    }
    
    //MARK: - isPhoneNumber
    var isPhoneNumber: Bool {
        let types: NSTextCheckingResult.CheckingType = [.phoneNumber]
        guard let detector = try? NSDataDetector(types: types.rawValue) else { return false }
        if let match = detector.matches(in: self, options: [], range: NSMakeRange(0, self.count)).first?.phoneNumber {
            return match == self
        } else {
            return false
        }
    }
    
    //MARK: - isValidPassword
    var isValidPassword: Bool {
        if self.count < 8 {
            return false
        }
        if self.range(of: #"\d+"#, options: .regularExpression) == nil {
            return false
        }
        if self.range(of: #"\p{Alphabetic}+"#, options: .regularExpression) == nil {
            return false
        }
        if self.range(of: #"\s+"#, options: .regularExpression) != nil {
            return false
        }
        return true
    }
}
