//
//  AddNewEmployeeViewModel.swift
//  AssetManagement
//
//  Created by Onur Torna on 18.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import Foundation

final class AddNewEmployeeState {

    enum Change {
        case error(message: String?)
        case loading(Bool)
        case success
    }

    var onChange: ((AddNewEmployeeState.Change) -> Void)?

    /// Loading state indicator
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

    /// Entered employee name by the admin
    var employeeName: String?
}

final class AddNewEmployeeViewModel {

    private let state = AddNewEmployeeState()
    private let dataController: AddNewEmployeeDataProtocol

    var stateChangeHandler: ((AddNewEmployeeState.Change) -> Void)? {
        get {
            return state.onChange
        }
        set {
            state.onChange = newValue
        }
    }

    init(dataController: AddNewEmployeeDataProtocol) {
        self.dataController = dataController
    }

    func updateEmployeeName(_ value: String?) {
        state.employeeName = value
    }
}

// MARK: - Network
extension AddNewEmployeeViewModel {

    func createNewEmployee() {

        state.isLoading = true
        dataController.createEmployee(name: state.employeeName) { [weak self] (user, error) in
            self?.state.isLoading = false
            guard let strongSelf = self else { return }
            guard error == nil else {
                strongSelf.state.receivedErrorMessage = error?.am_message
                return
            }

            if user != nil {
                strongSelf.stateChangeHandler?(.success)
            }
        }
    }
}
