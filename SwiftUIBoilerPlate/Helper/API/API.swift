//
//  API.swift
//  SwiftUIBoilerPlate
//
//  Created by AKASH BOGHANI on 11/12/23.
//

import Foundation
import Moya

enum API {
    case getMemes
}

extension API: TargetType {
    var baseURL: URL {
        return URL(string: "https://api.imgflip.com/")!
    }
    
    var path: String {
        switch self {
        case .getMemes:
            return "get_memes"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getMemes:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getMemes:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .getMemes:
            return ["Content-Type": "application/json"]
        }
    }
}
