//
//  HomeViewModel.swift
//  combine MVVM sample
//
//  Created by Amir Bakhshi on 2022-02-20.
//

import Foundation
import Combine

final class HomeViewModel {
    
    @Published var message: String?
    
    func createMessage() {
        guard let currentUser = NetworkService.shared.getLoggedInUser() else { return }
        message = "Welcome, \(currentUser.firstName) \(currentUser.lastName)"
    }
    
}
