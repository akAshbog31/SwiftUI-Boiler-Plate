//
//  Globals.swift
//  Squeezee
//
//  Created by iOS Developer on 19/09/23.
//

import Foundation
import UIKit

// MARK: - TypeAlice
typealias TaskBag = Set<TaskCancellable>

// MARK: - Properties
public let queue = DispatchQueue.main

// MARK: - ValidationError

// MARK: - ValidationError
enum ValidationError: Error {
    case empty(type: String)
    case inValidEmailOrPhonenumber
    case inValidPassword
    case conformPaaswordNotMatch
    case inValidOtpCount
}

// MARK: - CustomStringConvertible
extension ValidationError: CustomStringConvertible {
    var description: String {
        switch self {
        case let .empty(type):
            return "\(type) must not empty."
        case .inValidEmailOrPhonenumber:
            return "Email/Phone number is not valid."
        case .inValidPassword:
            return "Password length must be 8 and it should contain uppercase character, lowercase character and symbols."
        case .conformPaaswordNotMatch:
            return "Conform password not match with password."
        case .inValidOtpCount:
            return "OTP length must be 4."
        }
    }
}
