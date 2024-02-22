//
//  RouteViewState.swift
//  Golf
//
//  Created by AKASH BOGHANI on 24/12/23.
//

import SwiftUI

class RouteViewState<Screen: View>: ObservableObject {
    // MARK: - Properties
    @Published
    var isActive: Bool = false {
        didSet {
            if !isActive && next != nil {
                onPop()
            }
        }
    }

    @Published
    var next: RouteView<Screen>? {
        didSet {
            isActive = next != nil
        }
    }

    var onPop: () -> Void

    // MARK: - Init
    init(next: RouteView<Screen>? = nil, onPop: @escaping () -> Void = {}) {
        self.next = next
        self.onPop = onPop
    }
}
