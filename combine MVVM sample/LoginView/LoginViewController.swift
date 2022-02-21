//
//  LoginViewController.swift
//  combine MVVM sample
//
//  Created by Amir Bakhshi on 2022-02-20.
//

import UIKit
import Combine

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    private let viewModel = LoginViewModel()
    private var observers: Set<AnyCancellable> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupBinders()
    }
    
    @IBAction func loginPressed(_ sender: UIButton) {
        guard let email = emailTextfield.text, let password = passwordTextfield.text else { return }
        viewModel.login(email: email, password: password)
    }
    
    private func setupBinders() {
        viewModel.$error.sink { [weak self] error in
            if let error = error {
                print(error.localizedDescription)
            }
            else {
                self?.presentHomeViewController()
            }
        }
        .store(in: &observers)

    }
    
    private func presentHomeViewController() {
        let homeVC = storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        present(homeVC, animated: true, completion: nil)
    }
    
    
}
