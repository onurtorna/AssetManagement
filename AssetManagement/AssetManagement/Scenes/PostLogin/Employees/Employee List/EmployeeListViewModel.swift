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

    /// Total count of the employees
    var employeeCount: Int {
        return state.employees?.count ?? 0
    }

    /// Specific employee at the given index
    func employee(at index: Int) -> User? {
        guard let employees = state.employees else { return nil }
        return employees[index]
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
