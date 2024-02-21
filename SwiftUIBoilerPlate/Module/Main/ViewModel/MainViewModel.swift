//
//  MainViewModel.swift
//  SwiftUIBoilerPlate
//
//  Created by AKASH BOGHANI on 11/12/23.
//

import SwiftUI

@MainActor
final class MainViewModel: ObservableObject {
    // MARK: - Properties
    private var networkService: NetworkService
    private var taskDisposeBag = TaskBag()
    @Published var isLoading: Bool = false
    @Published var memsModel: MemsModel?

    // MARK: - Life-Cycle
    init(networkService: NetworkService = NetworkManager()) {
        self.networkService = networkService
    }

    // MARK: - Functions
    func getMems() {
        isLoading = true
        Task {
            do {
                let responseModel = try await networkService.getMems()
                memsModel = responseModel.data
                isLoading = false
            } catch let error as APIError {
                isLoading = false
                UIApplication.keyWindow?.rootViewController?.showAlert(msg: error.description)
            } catch {
                isLoading = false
                UIApplication.keyWindow?.rootViewController?.showAlert(msg: error.localizedDescription)
            }
        }.store(in: &taskDisposeBag)
    }
}
