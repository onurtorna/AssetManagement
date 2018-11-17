//
//  LoginViewController.swift
//  AssetManagement
//
//  Created by Onur Torna on 16.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet private weak var topImageView: UIImageView!
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var infoLabel: UILabel!

    var viewModel = LoginViewModel()
    @IBOutlet private weak var loginButton: UIButton!
    @IBOutlet private weak var scrollView: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()

        applyStyling()

        viewModel.stateChangeHandler = applyState(_:)
    }

}

// MARK: - Helpers
private extension LoginViewController {

    func applyState(_ change: LoginState.Change) {
        // TODO: To be implemented
    }

    func applyStyling() {
        // TODO: To be implemented
    }
}

// MARK: - Actions
extension LoginViewController {

    @IBAction func loginButtonTapped(_ sender: Any) {
    }

    @IBAction func textFieldEditingChanged(_ sender: UITextField) {
        if sender == emailTextField {
            viewModel.updateEmail(sender.text)
        } else if sender == passwordTextField {
            viewModel.updatePassword(sender.text)
        }
    }
}

