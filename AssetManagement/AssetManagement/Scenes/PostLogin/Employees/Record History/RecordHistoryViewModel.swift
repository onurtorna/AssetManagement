//
//  RecordHistroyViewModel.swift
//  AssetManagement
//
//  Created by Onur Torna on 18.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import Foundation

final class RecordHistoryState {

    enum Change {
        case error(message: String?)
        case loading(Bool)
        case dataFetch(isListEmpty: Bool)
    }

    var onChange: ((RecordHistoryState.Change) -> Void)?

    /// Employee who owns the asset history
    var employee: User

    var records: [Record]? {
        didSet {
            onChange?(.dataFetch(isListEmpty: records?.isEmpty ?? true))
        }
    }

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

final class RecordHistoryViewModel {

    private let state: RecordHistoryState
    private let dataController: RecordHistoryDataProtocol

    var stateChangeHandler: ((RecordHistoryState.Change) -> Void)? {
        get {
            return state.onChange
        }
        set {
            state.onChange = newValue
        }
    }

    /// Total number of records
    var recordCount: Int {
        return state.records?.count ?? 0
    }

    /// Specific record at given index
    func record(at index: Int) -> Record? {
        guard let records = state.records else { return nil }
        return records[index]
    }

    init(employee: User,
         dataController: RecordHistoryDataProtocol) {
        state = RecordHistoryState(employee: employee)
        self.dataController = dataController
    }
}

// MARK: - Network
extension RecordHistoryViewModel {

    /// Fetches all records related to current user
    func fetchAllRelatedRecords() {

        state.isLoading = true
        dataController.fetchAllRecords { [weak self] (records, error) in

            self?.state.isLoading = false
            guard let strongSelf = self else { return }
            guard error == nil else {
                strongSelf.state.receivedErrorMessage = error?.am_message
                return
            }

            /// Filter records which are related to current user
            if let records = records {

                var filteredRecords: [Record] = []
                for var record in records {
                    if record.fromEmployeeId == strongSelf.state.employee.id
                        || record.toEmployeeId == strongSelf.state.employee.id {

                        record.isReceiveRecord = record.toEmployeeId == strongSelf.state.employee.id
                        filteredRecords.append(record)
                    }
                }

                strongSelf.state.records = filteredRecords
            }
        }
    }
}
