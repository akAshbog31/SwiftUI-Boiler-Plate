//
//  Ext+View.swift
//  SwiftUIDemo
//
//  Created by iOS Developer on 11/12/23.
//

import Kingfisher
import SwiftUI

extension View {
    /// Make Conditional View
    /// - Parameters:
    ///   - condition: Only show view when this condition is `true`.
    ///   - content: Make condtional views body
    @ViewBuilder func `if`<Content: View>(_ condition: Bool, content: (Self) -> Content) -> some View {
        if condition {
            content(self)
        } else {
            self
        }
    }

    /// Navigate to a new view.
    /// - Parameters:
    ///   - view: View to navigate to.
    ///   - binding: Only navigates when this condition is `true`.
    func navigate<NewView: View>(to view: NewView, when binding: Binding<Bool>) -> some View {
        NavigationView {
            ZStack {
                self
//                    .navigationBarTitle("")
//                    .navigationBarHidden(true)

                NavigationLink(
                    destination: view,
                    isActive: binding
                ) {
                    EmptyView()
                }
            }
        }
        .navigationViewStyle(.stack)
    }

    /// Apply a custom border to the view.
    /// - Parameters:
    ///   - color: The color of the border.
    ///   - width: The width of the border.
    func customBorder(cornerRadius: CGFloat, color: Color, width: CGFloat) -> some View {
        overlay(
            RoundedRectangle(cornerRadius: cornerRadius.asDeviceHeight)
                .stroke(color, lineWidth: width)
        )
    }
}

// MARK: - HUD Hide & Show
extension View {
    func hud(isLoading: Binding<Bool>) -> some View {
        ZStack {
            self

            if isLoading.wrappedValue {
                ZStack {
                    HUDView(showHUD: isLoading)
                }
                .ignoresSafeArea()
            }
        }
    }
}

// MARK: - KFImage
extension View {
    func kfImage(from url: URL?, placeHolderImage: Image = Image.appPlaceHolder) -> KFImage {
        KFImage.url(url)
            .placeholder {
                placeHolderImage
            }
            .loadDiskFileSynchronously()
            .cacheMemoryOnly()
            .fade(duration: 0.5)
    }
}
