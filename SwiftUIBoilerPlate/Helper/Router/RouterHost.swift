//
//  RouterHost.swift
//  Golf
//
//  Created by AKASH BOGHANI on 24/12/23.
//

import SwiftUI

public typealias RouteMap<T, Screen> = (T) -> Screen

// MARK: - RouterHost
public struct RouterHost<T: Equatable, Screen: View>: View {
    // MARK: - Properties
    @ObservedObject private var router: Router<T>
    @ViewBuilder let routeMap: RouteMap<T, Screen>
    @State var pathViews = [Route<T>: Screen]()
    @State var content: RouteView<Screen>?

    // MARK: - Init
    public init(_ router: Router<T>, @ViewBuilder _ routeMap: @escaping RouteMap<T, Screen>) {
        self.router = router
        self.routeMap = routeMap
    }

    // MARK: - Body
    public var body: some View {
        NavigationView {
            content
        }
        #if !os(macOS)
        .navigationViewStyle(.stack)
        #endif
        .environmentObject(router)
        .onReceive(router.$paths) { paths in
            let (newContent, newPathViews) = router.getView(paths, routeMap, pathViews)
            self.content = newContent
            self.pathViews = newPathViews
        }
    }
}
