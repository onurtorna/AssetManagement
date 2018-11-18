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
        case assetsFetch
        case success
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

    /// All Assignable assets
    var assets: [Asset]? {
        didSet {
            onChange?(.assetsFetch)
        }
    }
    
    init(employee: User) {
        self.employee = employee
    }
}

final class AssignAssetToEmployeeViewModel {

    private let state: AssignAssetToEmployeeState
    private let dataController: AssignAssetToEmployeeProtocol

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

    /// Total asset count
    var assetCount: Int {
        return state.assets?.count ?? 0
    }

    /// Returns asset at specified index
    func asset(at index: Int) -> Asset? {
        guard let assets = state.assets else { return nil }
        return assets[index]
    }

    init(employee: User,
         dataController: AssignAssetToEmployeeProtocol) {
        state = AssignAssetToEmployeeState(employee: employee)
        self.dataController = dataController
    }
}

// MARK: - Network
extension AssignAssetToEmployeeViewModel {

    func fetchAssets() {

        state.isLoading = true
        dataController.fetchAllAssets { [weak self] (assets, error) in

            self?.state.isLoading = false
            guard let strongSelf = self else { return }
            guard error == nil else {
                strongSelf.state.receivedErrorMessage = error?.am_message
                return
            }

            if let assets = assets {
                // Filter assets that are already owned by the employee
                strongSelf.state.assets = assets.filter( { $0.employeeId != strongSelf.state.employee.id })
            }
        }
    }

    func assignAssetToEmployee(asset: Asset) {

        state.isLoading = true
        dataController.assignAssetToEmployee(
            assetId: asset.id,
            employeeId: state.employee.id) { [weak self] (error) in

                self?.state.isLoading = false
                guard let strongSelf = self else { return }
                guard error == nil else {
                    strongSelf.state.receivedErrorMessage = error?.am_message
                    return
                }

                strongSelf.stateChangeHandler?(.success)
        }
    }
}
