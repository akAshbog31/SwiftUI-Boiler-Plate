//
//  MainViewModel.swift
//  SwiftUIBoilerPlate
//
//  Created by AKASH BOGHANI on 11/12/23.
//

import Foundation

@MainActor final class MainViewModel: ObservableObject {
    //MARK: - Properties
    private var networkService: NetworkService
    @Published var isLoaing: Bool = false
    @Published var showAlert: Bool = false
    @Published var erroMessage: String = ""
    @Published var memsModel: MemsModel? = nil
    
    //MARK: - Life-Cycle
    init(networkService: NetworkService = NetworkManager()) {
        self.networkService = networkService
    }
    
    //MARK: - Enums
    enum Output {
        case loader(isLoading: Bool)
        case none
    }
    
    //MARK: - Functions
    func getMems() {
        isLoaing = true
        Task {
            do {
                let responseModel = try await networkService.getMems()
                isLoaing = false
                memsModel = responseModel.data
            } catch let error as APIError {
                isLoaing = false
                showAlert = true
                erroMessage = error.description
            } catch {
                isLoaing = false
                showAlert = true
                erroMessage = error.localizedDescription
            }
        }
    }
}

