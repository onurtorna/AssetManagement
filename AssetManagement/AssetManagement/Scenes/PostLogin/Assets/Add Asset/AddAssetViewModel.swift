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
        case success
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
    private let dataController: AddAssetDataProtocol

    var stateChangeHandler: ((AddAssetState.Change) -> Void)? {
        get {
            return state.onChange
        }
        set {
            state.onChange = newValue
        }
    }

    init(dataController: AddAssetDataProtocol) {
        self.dataController = dataController
    }
}

// MARK: - Network
extension AddAssetViewModel {

    func addAsset(name: String?,
                  notes: String?,
                  serialNumber: String?) {

        state.isLoading = true
        dataController.createAsset(name: name,
                                   notes: notes,
                                   serialNumber: serialNumber) { [weak self] (asset, error) in

                                    self?.state.isLoading = false
                                    guard let strongSelf = self else { return }
                                    guard error == nil else {
                                        strongSelf.state.receivedErrorMessage = error?.am_message
                                        return
                                    }

                                    if asset != nil {
                                        strongSelf.stateChangeHandler?(.success)
                                    }
        }
    }
}
