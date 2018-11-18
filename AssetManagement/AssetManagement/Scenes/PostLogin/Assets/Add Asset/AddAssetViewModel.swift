//
//  AddAssetViewModel.swift
//  AssetManagement
//
//  Created by Onur Torna on 18.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import Foundation

final class AddAssetState {

    enum Change {
        case error(message: String?)
        case loading(Bool)
    }

    var onChange: ((AddAssetState.Change) -> Void)?

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

final class AddAssetViewModel {

    private let state = AddAssetState()

    var stateChangeHandler: ((AddAssetState.Change) -> Void)? {
        get {
            return state.onChange
        }
        set {
            state.onChange = newValue
        }
    }

}
