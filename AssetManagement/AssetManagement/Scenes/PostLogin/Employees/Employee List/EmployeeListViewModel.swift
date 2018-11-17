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
}

final class EmployeeListViewModel {

    private let state = EmployeeListState()

    var stateChangeHandler: ((EmployeeListState.Change) -> Void)? {
        get {
            return state.onChange
        }
        set {
            state.onChange = newValue
        }
    }
}
