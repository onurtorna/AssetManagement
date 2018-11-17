//
//  AssetListViewModel.swift
//  AssetManagement
//
//  Created by Onur Torna on 18.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import Foundation

final class AssetListState {

    enum Change {
        case error(message: String?)
        case loading(Bool)
        case initialPublish(name: String)
    }

    var onChange: ((AssetListState.Change) -> Void)?

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

final class AssetListViewModel {

    private let state = AssetListState()

    var stateChangeHandler: ((AssetListState.Change) -> Void)? {
        get {
            return state.onChange
        }
        set {
            state.onChange = newValue
        }
    }
}
