//
//  API.swift
//  SwiftUIBoilerPlate
//
//  Created by AKASH BOGHANI on 11/12/23.
//

import Foundation

// MARK: - API
enum API {
    case getMemes
}

// MARK: - APIProtocol
extension API: APIProtocol {
    var baseURL: String {
        "https://api.imgflip.com/"
    }

    var path: String {
        switch self {
        case .getMemes:
            return "get_memes"
        }
    }

    var method: APIMethod {
        switch self {
        case .getMemes:
            return .get
        }
    }

    var task: Request {
        switch self {
        case .getMemes:
            return .requestPlain
        }
    }

    var header: [String: String] {
        switch self {
        case .getMemes:
            return ["Content-Type": "application/json"]
        }
    }
}
