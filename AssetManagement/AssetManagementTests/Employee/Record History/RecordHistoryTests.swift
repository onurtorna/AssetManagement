//
//  RecordHistoryTests.swift
//  AssetManagementTests
//
//  Created by Onur Torna on 19.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import XCTest
@testable import AssetManagement

private class Box {
    let viewModel: RecordHistoryViewModel
    var state = RecordHistoryState(employee: User(id: 1, name: "name", email: "email"))

    var changeCount = 0

    init(with dataController: RecordHistoryDataProtocol = RecordHistoryDummyDataController()) {
        viewModel = RecordHistoryViewModel(employee: User(id: 1, name: "name", email: "email"),
                                           dataController: dataController)

        viewModel.stateChangeHandler = { [unowned self] in
            switch $0 {
            case .error:
                self.changeCount += 1
            case .loading:
                self.changeCount += 1
            case .dataFetch:
                self.changeCount += 1
            }
        }
    }
}

class RecordHistoryTests: XCTestCase {

    func testRecordFetching() {
        let box = Box()
        box.viewModel.fetchAllRelatedRecords()
        XCTAssertTrue(box.viewModel.recordCount == 2)
    }

    func testSpecificItemFetch() {
        let box = Box()
        box.viewModel.fetchAllRelatedRecords()
        XCTAssertTrue(box.viewModel.record(at: 1)?.id == 11)
    }

    func testChangeCount() {
        let box = Box()
        box.viewModel.fetchAllRelatedRecords()
        XCTAssertTrue(box.changeCount == 3)
    }
}
