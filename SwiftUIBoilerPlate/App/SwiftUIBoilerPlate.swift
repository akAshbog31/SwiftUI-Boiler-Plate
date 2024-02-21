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
    @StateObject private var rootManager = RootManager()

    // MARK: - LifeCycle
    var body: some Scene {
        WindowGroup {
            Group {
                switch rootManager.currentRoot {
                case .main: MainView()
                }
            }
            .environmentObject(rootManager)
        }
    }

    // MARK: - Body

    // MARK: - Functions
}
