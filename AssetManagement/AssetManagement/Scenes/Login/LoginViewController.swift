//
//  LoginViewController.swift
//  AssetManagement
//
//  Created by Onur Torna on 16.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    private enum Constant {
        static let keyboardMargin: CGFloat = 20
    }

    @IBOutlet private weak var topImageView: UIImageView!
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var infoLabel: UILabel!
    @IBOutlet private weak var loginButton: UIButton!
    @IBOutlet private weak var scrollView: UIScrollView!

    private var isKeyboardPresent = false
    private var lastContentInset = UIEdgeInsets.zero


    var viewModel = LoginViewModel(dataController: LoginDataController())

    override func viewDidLoad() {
        super.viewDidLoad()

        applyStyling()
        registerForKeyboardNotifications()

        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self,
                                                                 action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
        
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

    func registerForKeyboardNotifications() {

        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow(notification:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide(notification:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
}

// MARK: - Actions
extension LoginViewController {

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    @IBAction func loginButtonTapped(_ sender: Any) {
        viewModel.login()
    }

    @IBAction func textFieldEditingChanged(_ sender: UITextField) {
        if sender == emailTextField {
            viewModel.updateEmail(sender.text)
        } else if sender == passwordTextField {
            viewModel.updatePassword(sender.text)
        }
    }
}

// MARK: - Keyboard
extension LoginViewController {

    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey]
            as? NSValue)?.cgRectValue,
            !isKeyboardPresent {

            let contentInsets = UIEdgeInsets(top: 0.0,
                                             left: 0.0,
                                             bottom: keyboardSize.height + Constant.keyboardMargin,
                                             right: 0.0)

            lastContentInset = scrollView.contentInset
            scrollView.contentInset = contentInsets
            scrollView.scrollIndicatorInsets = contentInsets

            DispatchQueue.main.async {
                self.scrollView.scrollRectToVisible(self.loginButton.frame,
                                                    animated: true)
            }

            isKeyboardPresent = true
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        if (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey]
            as? NSValue)?.cgRectValue != nil {

            let contentInset = lastContentInset
            scrollView.contentInset = contentInset
            scrollView.scrollIndicatorInsets = contentInset
            isKeyboardPresent = false
        }
    }
}

