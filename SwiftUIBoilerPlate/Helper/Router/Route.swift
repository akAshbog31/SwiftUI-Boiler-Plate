//
//  Route.swift
//  Golf
//
//  Created by AKASH BOGHANI on 24/12/23.
//

import SwiftUI

struct Route<T: Equatable>: Equatable, Hashable {
    // MARK: - Properties
    let route: T
    let id: String = UUID().uuidString

    // MARK: - Functions
    static func == (lhs: Route, rhs: Route) -> Bool {
        lhs.route == rhs.route && lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
