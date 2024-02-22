//
//  SwiftUIBoilerPlate.swift
//  SwiftUIDemo
//
//  Created by iOS Developer on 11/12/23.
//

import SwiftUI

@main
struct SwiftUIBoilerPlate: App {
    // MARK: - Properties
    @StateObject private var router = Router(initial: AppRoutes.main)

    // MARK: - LifeCycle
    var body: some Scene {
        WindowGroup {
            RouterHost(router) { route in
                switch route {
                case .main: MainView()
                case let .text(text): Text(text)
                }
            }
        }
    }

    // MARK: - Body

    // MARK: - Functions
}
