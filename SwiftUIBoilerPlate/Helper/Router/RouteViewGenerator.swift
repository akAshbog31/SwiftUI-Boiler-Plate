//
//  RouteViewGenerator.swift
//  Golf
//
//  Created by AKASH BOGHANI on 24/12/23.
//

import SwiftUI

class RouteViewGenerator<T: Equatable> {
    // MARK: - Properties
    var onPop: ((Route<T>) -> Void)?

    // MARK: - Functions
    func generate<Screen: View>(
        _ paths: [Route<T>],
        @ViewBuilder _ routeMap: RouteMap<T, Screen>,
        _ pathViews: [Route<T>: Screen]
    ) -> (RouteView<Screen>?, [Route<T>: Screen]) {
        var pathViews = recycleViews(paths, pathViews: pathViews)
        var current: RouteView<Screen>?
        for path in paths.reversed() {
            let view = pathViews[path] ?? routeMap(path.route)
            pathViews[path] = view
            let content = RouteView(view, state: RouteViewState())
            content.state.next = current
            content.state.onPop = current == nil ? {} : { [weak self] in
                if let self = self {
                    self.onPop?(path)
                }
            }
            current = content
        }
        return (current, pathViews)
    }

    private func recycleViews<Screen: View>(_ paths: [Route<T>], pathViews: [Route<T>: Screen]) -> [Route<T>: Screen] {
        var pathViews = pathViews
        for key in pathViews.keys where !paths.contains(key) {
            pathViews.removeValue(forKey: key)
        }
        return pathViews
    }
}
