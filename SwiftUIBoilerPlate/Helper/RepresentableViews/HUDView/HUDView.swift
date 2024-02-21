//
//  HUDView.swift
//  SwiftUIBoilerPlate
//
//  Created by AKASH BOGHANI on 21/02/24.
//

import SwiftUI
import UIKit

// MARK: - HUDView
struct HUDView: UIViewControllerRepresentable {
    @Binding var showHUD: Bool

    func makeUIViewController(context _: Context) -> HUDViewController {
        HUDViewController(showHUD: $showHUD)
    }

    func updateUIViewController(_ uiViewController: HUDViewController, context _: Context) {
        uiViewController.showHUD = showHUD
    }
}

// MARK: - HUDViewController
final class HUDViewController: UIViewController {
    var showHUD: Bool {
        didSet {
            showHUD ? showHUD() : hideHUD()
        }
    }

    init(showHUD: Binding<Bool>) {
        self.showHUD = showHUD.wrappedValue
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
