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
    @EnvironmentObject private var router: Router<AppRoutes>
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

                        Text(mem.name ?? "")
                            .padding(.bottom)
                            .multilineTextAlignment(.center)
                            .font(.poppins(24, .semibold))
                    }
                    .background(Material.ultraThin)
                    .clipShape(
                        RoundedRectangle(cornerRadius: 16.asDeviceHeight)
                    )
                    .shadow(radius: 10)
                    .onTapGesture {
                        router.push(.text(text: mem.name ?? ""))
                    }
                    .padding(.vertical)
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
