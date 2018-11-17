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

    override func viewDidLoad() {
        super.viewDidLoad()

        applyStyling()
    }
}

// MARK: - Helpers
private extension LoginViewController {

    func applyStyling() {
        // TODO: To be implemented
    }
}

// MARK: - Actions
extension LoginViewController: UITextFieldDelegate {

    @IBAction func textFieldEditingChanged(_ sender: UITextField) {
        // TODO: To be implemented
        if sender == emailTextField {

        } else if sender == passwordTextField {

        }
    }
}

