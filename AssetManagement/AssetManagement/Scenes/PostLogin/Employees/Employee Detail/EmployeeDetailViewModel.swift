//
//  EmployeeDetailViewModel.swift
//  AssetManagement
//
//  Created by Onur Torna on 17.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import Foundation

final class EmployeeDetailState {

    enum Change {
        case error(message: String?)
        case loading(Bool)
    }

    var onChange: ((EmployeeDetailState.Change) -> Void)?

    var employee: User

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

    init(employee: User) {
        self.employee = employee
    }
}

final class EmployeeDetailViewModel {

    private let state: EmployeeDetailState

    var stateChangeHandler: ((EmployeeDetailState.Change) -> Void)? {
        get {
            return state.onChange
        }
        set {
            state.onChange = newValue
        }
    }

    init(employee: User) {
        state = EmployeeDetailState(employee: employee)
    }
}
