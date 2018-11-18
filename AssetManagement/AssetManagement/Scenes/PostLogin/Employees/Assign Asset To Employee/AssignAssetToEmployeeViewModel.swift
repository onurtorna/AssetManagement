//
//  AssignAssetToEmployeeViewModel.swift
//  AssetManagement
//
//  Created by Onur Torna on 18.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import Foundation

final class AssignAssetToEmployeeState {

    enum Change {
        case error(message: String?)
        case loading(Bool)
        case initialPublish(String)
    }

    var onChange: ((AssignAssetToEmployeeState.Change) -> Void)?

    /// Employee to assign a asset
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

final class AssignAssetToEmployeeViewModel {

    private let state: AssignAssetToEmployeeState

    var stateChangeHandler: ((AssignAssetToEmployeeState.Change) -> Void)? {
        get {
            return state.onChange
        }
        set {
            state.onChange = newValue

            if let employeeFirstname = state.employee.name.split(separator: " ").first {
                stateChangeHandler?(.initialPublish(String(employeeFirstname)))
            }
        }
    }

    init(employee: User) {
        state = AssignAssetToEmployeeState(employee: employee)
    }
}
