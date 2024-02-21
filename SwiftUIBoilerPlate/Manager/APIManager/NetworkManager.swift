//
//  NetworkManager.swift
//  SwiftUIBoilerPlate
//
//  Created by AKASH BOGHANI on 11/12/23.
//

import Foundation

class NetworkManager: NetworkService {
    func getMems() async throws -> MainModel<MemsModel> {
        try await APIService.request(API.getMemes)
    }
}
