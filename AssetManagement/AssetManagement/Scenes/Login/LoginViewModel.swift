//
//  LoginViewModel.swift
//  AssetManagement
//
//  Created by Onur Torna on 17.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import Foundation

final class LoginState {

    enum Change {
        case error(message: String?)
        case loading(Bool)
        case success
    }

    var onChange: ((LoginState.Change) -> Void)?

    var isLoading = false {
        didSet {
            onChange?(.loading(isLoading))
        }
    }

    /// Received error message to show to user
    var receivedErrorMessage: String? {
        didSet {
            onChange?(.error(message: receivedErrorMessage))
        }
    }

    /// User's entered email
    var email: String?

    /// Entered password by user
    var password: String?
}

final class LoginViewModel {

    private var state = LoginState()
    private var dataController: LoginDataProtocol

    var stateChangeHandler: ((LoginState.Change) -> Void)? {
        get {
            return state.onChange
        }
        set {
            state.onChange = newValue
        }
    }

    func updateEmail(_ email: String?) {
        state.email = email
    }

    func updatePassword(_ password: String?) {
        state.password = password
    }

    init(dataController: LoginDataProtocol) {
        self.dataController = dataController
    }
}

// MARK: - Network
extension LoginViewModel {

    func login() {

        state.isLoading = true
        dataController.login(email: state.email,
                             password: state.password) { [weak self] (user, token, error) in

                                self?.state.isLoading = false
                                guard let strongSelf = self else { return }
                                guard error == nil else {
                                    strongSelf.state.receivedErrorMessage = error?.am_message
                                    return
                                }

                                SessionManager.shared.user = user
                                SessionManager.shared.authentiactionToken = token
                                
                                strongSelf.stateChangeHandler?(.success)
        }
    }
}
