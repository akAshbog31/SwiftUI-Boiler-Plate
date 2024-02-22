//
//  RouteView.swift
//  Golf
//
//  Created by AKASH BOGHANI on 24/12/23.
//

import SwiftUI

// MARK: - RouteView
struct RouteView<Screen: View>: View {
    // MARK: - Properties
    private let content: Screen
    @ObservedObject var state: RouteViewState<Screen>

    // MARK: - Init
    public init(_ content: Screen, state: RouteViewState<Screen>) {
        self.content = content
        self.state = state
    }

    // MARK: - Body
    var body: some View {
        VStack {
            NavigationLink(destination: self.state.next, isActive: self.$state.isActive) {
                EmptyView()
            }
            #if os(iOS)
            .isDetailLink(false)
            #endif

            content
                .hideNavigationBar() // MARK: - hide navigation bar for all over app
        }
    }
}

// MARK: - Extention + View
extension View {
    @ViewBuilder
    func hideNavigationBar() -> some View {
        self
            .navigationTitle("")
            .navigationBarBackButtonHidden()
    }
}
