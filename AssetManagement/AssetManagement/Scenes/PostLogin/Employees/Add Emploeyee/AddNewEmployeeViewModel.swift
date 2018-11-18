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
        case dataFetch
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
}

final class AddNewEmployeeViewModel {

    private let state = AddNewEmployeeState()

    var stateChangeHandler: ((AddNewEmployeeState.Change) -> Void)? {
        get {
            return state.onChange
        }
        set {
            state.onChange = newValue
        }
    }
}
