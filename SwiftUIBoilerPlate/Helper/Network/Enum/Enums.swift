//
//  Enums.swift
//  Squeezee
//
//  Created by iOS Developer on 21/08/23.
//

import Foundation

// MARK: - APIError
enum APIError: Error {
    case badRequest
    case invalidURL(urlStr: String)
}

// MARK: - CustomStringConvertible
extension APIError: CustomStringConvertible {
    var description: String {
        switch self {
        case .badRequest:
            return "Api request is bad."
        case let .invalidURL(urlStr):
            return "\(urlStr) is invalid url."
        }
    }
}

// MARK: - APIMethod
enum APIMethod: String {
    case get, post, put, patch, delete
}

// MARK: - Request
enum Request {
    case jsonEncoding(_ model: [String: Any]?)
    case queryString(_ dict: [String: Any]?)
    case multiPart(_ multiPart: MultipartRequest)
    case requestPlain

    var jsonBody: [String: Any]? {
        switch self {
        case let .jsonEncoding(model):
            return model
        case .queryString, .multiPart, .requestPlain: return nil
        }
    }

    var queryItem: [URLQueryItem] {
        switch self {
        case .jsonEncoding, .multiPart, .requestPlain:
            return []
        case let .queryString(dict):
            return dict?.asQueryParam ?? []
        }
    }

    var formData: MultipartRequest? {
        switch self {
        case .jsonEncoding, .queryString, .requestPlain: return nil
        case let .multiPart(multiPart):
            return multiPart
        }
    }
}
