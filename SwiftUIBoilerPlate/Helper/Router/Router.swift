//
//  Router.swift
//  Golf
//
//  Created by AKASH BOGHANI on 24/12/23.
//

import SwiftUI

public class Router<T: Equatable>: ObservableObject {
    // MARK: - Properties
    private let viewGenerator = RouteViewGenerator<T>()
    @Published var paths: [Route<T>] = []
    public var stack: [T] { paths.map { $0.route } }

    // MARK: - Init
    public init(initial: T) {
        viewGenerator.onPop = { [weak self] path in
            if let self = self, self.paths.count > 1
                && path.id == self.paths[self.paths.count - 2].id {
                self.pop()
            }
        }

        push(initial)
    }

    // MARK: - Functions
    public func push(_ route: T) {
        paths.append(Route(route: route))
    }

    public func pop() {
        if !paths.isEmpty {
            paths.removeLast()
        }
    }

    public func popTo(_ route: T, inclusive: Bool = false) {
        if paths.isEmpty {
            return
        }

        guard var found = paths.firstIndex(where: { $0.route == route }) else {
            return
        }

        if !inclusive {
            found += 1
        }

        let numToPop = (found ..< paths.endIndex).count
        paths.removeLast(numToPop)
    }

    func getView<Screen: View>(_ paths: [Route<T>], _ routeMap: RouteMap<T, Screen>, _ pathViews: [Route<T>: Screen]) -> (RouteView<Screen>?, [Route<T>: Screen]) {
        viewGenerator.generate(paths, routeMap, pathViews)
    }
}
