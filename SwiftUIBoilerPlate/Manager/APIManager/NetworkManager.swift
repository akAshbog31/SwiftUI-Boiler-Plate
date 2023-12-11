//
//  NetworkManager.swift
//  SwiftUIBoilerPlate
//
//  Created by AKASH BOGHANI on 11/12/23.
//

import Foundation
import Moya

class NetworkManager: NetworkService {
    private let provider = MoyaProvider<API>(plugins: [NetworkLoggerPlugin(configuration: .init(formatter: .init(), output: { target, items in
        if let log = items.first {
            print(log)
        }
    }, logOptions: .formatRequestAscURL))])
    
    func getMems() async throws -> MainModel<MemsModel> {
        return try await request(.getMemes)
    }
}

extension NetworkManager {
    func request<T: Codable>(_ target: API) async throws -> T {
        return try await withCheckedThrowingContinuation { continuation in
            provider.request(target) { result in
                switch result {
                case .success(let response):
                    do {
                        let model = try JSONDecoder().decode(T.self, from: response.data)
                        switch response.statusCode {
                        case 200...299:
                            continuation.resume(returning: model)
                        default:
                            continuation.resume(throwing: APIError.badRequest(mesaage: "Bad request"))
                        }
                    } catch {
                        continuation.resume(throwing: error)
                    }
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}
