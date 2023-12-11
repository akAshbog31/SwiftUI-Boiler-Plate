//
//  NetworkService.swift
//  SwiftUIBoilerPlate
//
//  Created by AKASH BOGHANI on 11/12/23.
//

import Foundation

protocol NetworkService {
    func getMems() async throws -> MainModel<MemsModel>
}
