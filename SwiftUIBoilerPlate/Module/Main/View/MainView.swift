//
//  MainView.swift
//  SwiftUIDemo
//
//  Created by iOS Developer on 11/12/23.
//

import SwiftUI

// MARK: - MainView
struct MainView: View {
    // MARK: - Properties
    @ObservedObject private var viewModel = MainViewModel()

    // MARK: - LifeCycle

    // MARK: - Body
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVStack {
                ForEach(viewModel.memsModel?.memes ?? [], id: \.id) { mem in
                    VStack(spacing: 12.asDeviceHeight) {
                        kfImage(from: URL(string: mem.url ?? ""))
                            .resizable()
                            .frame(maxWidth: .infinity)
                            .frame(height: 200.asDeviceHeight)
                            .aspectRatio(contentMode: .fill)
                            .clipShape(
                                RoundedRectangle(cornerRadius: 12.asDeviceHeight)
                            )

                        Text(mem.name ?? "")
                            .padding(.vertical, 8)
                            .multilineTextAlignment(.center)
                            .font(.poppins(24, .semibold))

                        Divider()
                    }
                }
            }
            .padding(.horizontal, 20)
            .frame(maxWidth: .infinity)
        }
        .hud(isLoading: $viewModel.isLoading)
        .onAppear {
            viewModel.getMems()
        }
    }

    // MARK: - Functions
}

// MARK: - MainView_Previews
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
