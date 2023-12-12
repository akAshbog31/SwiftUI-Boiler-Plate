//
//  MainView.swift
//  SwiftUIDemo
//
//  Created by iOS Developer on 11/12/23.
//

import SwiftUI

struct MainView: View {
    //MARK: - Properties
    @ObservedObject private var viewModel = MainViewModel()
    
    //MARK: - LifeCycle
    
    //MARK: - Body
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVStack {
                ForEach(viewModel.memsModel?.memes ?? [], id: \.id) { mem in
                    VStack(spacing: 12.asDeviceHeight) {
                        AsyncImage(url: URL(string: mem.url ?? "")) { image in
                            image
                                .resizable()
                                .frame(maxWidth: .infinity)
                                .frame(height: 500.asDeviceHeight)
                                .clipShape(
                                    RoundedRectangle(cornerRadius: 12.asDeviceHeight)
                                )
                        } placeholder: {
                            Image(.appPlaceholder)
                                .resizable()
                                .frame(maxWidth: .infinity)
                                .frame(height: 500.asDeviceHeight)
                                .clipShape(
                                    RoundedRectangle(cornerRadius: 12.asDeviceHeight)
                                )
                        }
                        
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
        .backGroundColor(.appTheme)
        .showHUD(viewModel.isLoaing)
        .task {
            viewModel.getMems()
        }
        .showDefaultAlert(message: viewModel.erroMessage, isPresented: $viewModel.showAlert)
    }
    
    //MARK: - Functions
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
