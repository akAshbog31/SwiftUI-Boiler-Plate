//
//  MainModel.swift
//  mvvmdemo
//
//  Created by mac on 19/10/22.
//

import Foundation

// MARK: - MainModel
struct MainModel<T: Codable>: Codable {
    let success: Bool?
    let data: T?
}

// MARK: - MemsModel
struct MemsModel: Codable {
    let memes: [Mems]?
}

// MARK: - Mems
struct Mems: Codable, Identifiable {
    let id: String?
    let name: String?
    let url: String?
    let width: Int?
    let height: Int?
    let box_count: Int?
}
