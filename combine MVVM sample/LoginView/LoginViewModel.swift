//
//  LoginViewModel.swift
//  combine MVVM sample
//
//  Created by Amir Bakhshi on 2022-02-20.
//

import Foundation
import Combine

final class LoginViewModel {
    
    @Published var error: NetworkError?
    
    func login(email: String, password: String) {
        NetworkService.shared.login(email: email, password: password) { [weak self] success in
            self?.error = success ? nil : .failure
        }
    }
}

