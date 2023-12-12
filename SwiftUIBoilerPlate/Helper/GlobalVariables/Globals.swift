//
//  Globals.swift
//  Squeezee
//
//  Created by iOS Developer on 19/09/23.
//

import Foundation
import UIKit
import Combine

//MARK: - TypeAlice
typealias Bag = Set<AnyCancellable>
typealias TaskBag = Set<TaskCancellable>
typealias AppSubject<T> = PassthroughSubject<T, Never>
typealias AppAnyPublisher<T> = AnyPublisher<T, Never>

//MARK: - Properties
public let queue = DispatchQueue.main

//MARK: - Globals
enum Globals {
    //MARK: - Key Window
    static var keyWindow: UIWindow? {
        return UIApplication.shared.connectedScenes.compactMap { ($0 as? UIWindowScene)?.keyWindow }.last
    }
}

//MARK: - ValidationError
enum ValidationError: Error {
    case empty(type: String)
    case inValidEmailOrPhonenumber
    case inValidPassword
    case conformPaaswordNotMatch
    case inValidOtpCount
}

extension ValidationError: CustomStringConvertible {
    var description: String {
        switch self {
        case .empty(let type):
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

//MARK: - APIError
enum APIError: Error {
    case badRequest(mesaage: String)
    case decodingError
    case invalidURL(urlStr: String)
}

extension APIError: CustomStringConvertible {
    var description: String {
        switch self {
        case .badRequest(let mesaage):
            return mesaage
        case .decodingError:
            return "Data could not be decodable."
        case .invalidURL(let urlStr):
            return "\(urlStr) is invalid url."
        }
    }
}
