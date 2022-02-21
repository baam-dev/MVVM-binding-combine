//
//  ViewController.swift
//  combine MVVM sample
//
//  Created by Amir Bakhshi on 2022-02-20.
//

import UIKit
import Combine

class HomeViewController: UIViewController {

    @IBOutlet weak var infoLabel: UILabel!
    
    private let viewModel = HomeViewModel()
    private var observers: Set<AnyCancellable> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBinders()
        viewModel.createMessage()
    }

    // bind to "message" changes
    private func setupBinders() {
        viewModel.$message.sink { completion in
            // closure triggered everytime there is an update ...
            switch completion {
            case .finished:
                print("sucess")
            case .failure(let err):
                print(err)
            }
        } receiveValue: { [weak self] welcomeMessage in
            self?.infoLabel.text = welcomeMessage
        }
        .store(in: &observers)

    }

}

