//
//  RootManager.swift
//  SwiftUIDemo
//
//  Created by iOS Developer on 11/12/23.
//

import Foundation

final class RootManager: ObservableObject {
    // MARK: - Properties
    @Published var currentRoot: Root = .main

    // MARK: - Root
    enum Root {
        case main
    }
}
