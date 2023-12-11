//
//  Ext+View.swift
//  SwiftUIDemo
//
//  Created by iOS Developer on 11/12/23.
//

import SwiftUI

extension View {
    /// Make Conditional View
    /// - Parameters:
    ///   - condition: Only show view when this condition is `true`.
    ///   - content: Make condtional views body
    @ViewBuilder func `if`<Content: View>(_ condition: Bool, content: (Self) -> Content) -> some View {
        if(condition) {
            content(self)
        } else {
            self
        }
    }
    
    /// Navigate to a new view.
    /// - Parameters:
    ///   - view: View to navigate to.
    ///   - binding: Only navigates when this condition is `true`.
    func `navigate`<NewView: View>(to view: NewView, when binding: Binding<Bool>) -> some View {
        NavigationView {
            ZStack {
                self
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
                
                NavigationLink(
                    destination: view
                        .navigationBarTitle("")
                        .navigationBarHidden(true),
                    isActive: binding
                ) {
                    EmptyView()
                }
            }
        }
        .navigationViewStyle(.stack)
    }
    
    /// Show loader
    /// - Parameters:
    ///   - condition: Only show loader when this condition is `true`.
    @ViewBuilder func `showHUD`(_ condition: Bool) -> some View {
        ZStack {
            self
            
            if condition {
                VStack(spacing: 5.asDeviceHeight) {
                    ProgressView("Loading...")
                        .scaleEffect(2)
                        .font(.poppins(10, .semibold))
                        .tint(.black)
                        .foregroundStyle(.black)
                }
                .ignoresSafeArea()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        .animation(.easeInOut, value: condition)
        .allowsHitTesting(!condition)
    }
    
    /// Apply a custom border to the view.
    /// - Parameters:
    ///   - color: The color of the border.
    ///   - width: The width of the border.
    func customBorder(cornerRadius: CGFloat, color: Color, width: CGFloat) -> some View {
        self
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius.asDeviceHeight)
                    .stroke(color, lineWidth: width)
            )
    }
    
    func showDefaultAlert(_ title: String = "SwiftUIBoilerPlate",
                          message: String,
                          isPresented: Binding<Bool>) -> some View {
        self
            .alert(title, isPresented: isPresented) {
                Button("OK") {}
            } message: {
                Text(message)
            }
    }
}
