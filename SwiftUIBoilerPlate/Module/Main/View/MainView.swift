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
            VStack {
                ForEach(viewModel.memsModel?.memes ?? [], id: \.id) { mem in
                        Text(mem.name ?? "")
                            .padding(.vertical, 8)
                            .multilineTextAlignment(.center)
                            .font(.poppins(24, .semibold))
                        
                        Divider()
                }
            }
            .padding(.horizontal, 20)
            .frame(maxWidth: .infinity)
        }
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
