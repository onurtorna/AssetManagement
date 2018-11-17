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
        case dataFetch
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

    /// All assets
    var assets: [Asset]? {
        didSet {
            onChange?(.dataFetch)
        }
    }
}

final class AssetListViewModel {

    private let state = AssetListState()
    private let dataController: AssetListDataProtocol

    var stateChangeHandler: ((AssetListState.Change) -> Void)? {
        get {
            return state.onChange
        }
        set {
            state.onChange = newValue
        }
    }

    init(dataController: AssetListDataProtocol) {
        self.dataController = dataController
    }
}

// MARK: - Network
extension AssetListViewModel {

    func fetchAssets() {

        state.isLoading = true
        dataController.fetchAllAssets { [weak self] (assets, error) in

            self?.state.isLoading = false
            guard let strongSelf = self else { return }
            guard error == nil else {
                strongSelf.state.receivedErrorMessage = error?.am_message
                return
            }

            strongSelf.state.assets = assets
        }
    }
}
