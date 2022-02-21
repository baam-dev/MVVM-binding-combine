//
//  NetworkService.swift
//  combine MVVM sample
//
//  Created by Amir Bakhshi on 2022-02-20.
//

import Foundation

public enum NetworkError: Error {
    case failure
    
    public var localizedDescription: String {
        switch self {
        case .failure:
            return "Failed to login"
        }
    }
}

final class NetworkService {
    
    static let shared = NetworkService()
    private var user: User?
    
    private init () { }
    
    func login(email: String, password: String, completion: @escaping(Bool) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            if email != "" && password != "" {
                self?.user = User(firstName: "Mr", lastName: "Nobody", email: "Nobody@example.com", age: 200)
                completion(true)
            }
            else {
                self?.user = nil
                completion(false)
            }
        }
    }
    
    func getLoggedInUser() -> User? {
        guard let user = user else {
            return nil
        }
        return user

    }
}
