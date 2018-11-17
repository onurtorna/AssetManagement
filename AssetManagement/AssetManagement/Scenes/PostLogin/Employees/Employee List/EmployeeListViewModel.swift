//
//  EmployeeListViewModel.swift
//  AssetManagement
//
//  Created by Onur Torna on 17.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import Foundation

final class EmployeeListState {

    enum Change {
        case error(message: String?)
        case loading(Bool)
        case dataFetch
    }

    var onChange: ((EmployeeListState.Change) -> Void)?

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

    var employees: [User]? {
        didSet {
            onChange?(.dataFetch)
        }
    }
}

final class EmployeeListViewModel {

    private let state = EmployeeListState()
    private var dataController: EmployeeListDataProtocol

    var stateChangeHandler: ((EmployeeListState.Change) -> Void)? {
        get {
            return state.onChange
        }
        set {
            state.onChange = newValue
        }
    }

    init(dataController: EmployeeListDataProtocol) {
        self.dataController = dataController
    }
}

// MARK: - Network
extension EmployeeListViewModel {

    func fetchEmployees() {

        state.isLoading = true
        dataController.fetchAllEmployees { [weak self] (employees, error) in

            self?.state.isLoading = false
            guard let strongSelf = self else { return }
            guard error == nil else {
                strongSelf.state.receivedErrorMessage = error?.am_message
                return
            }

            strongSelf.state.employees = employees
        }
    }
}
