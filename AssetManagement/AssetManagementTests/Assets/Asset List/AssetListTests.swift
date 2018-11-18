//
//  AssetListTests.swift
//  AssetManagementTests
//
//  Created by Onur Torna on 18.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import XCTest
@testable import AssetManagement

private class Box {
    let viewModel: AssetListViewModel
    var state = AssetListState()

    var changeCount = 0

    init(with dataController: AssetListDataProtocol = AssetListDummyDataController()) {
        viewModel = AssetListViewModel(dataController: dataController)

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

class AssetListTests: XCTestCase {

    func testListFetching() {
        let box = Box()
        box.viewModel.fetchAssets()
        XCTAssertTrue(box.viewModel.assetCount == 2)
    }

    func testSpecificItemFetch() {
        let box = Box()
        box.viewModel.fetchAssets()
        XCTAssertTrue(box.viewModel.asset(at: 1)?.id == 9)
    }

    func testChangeCount() {
        let box = Box()
        box.viewModel.fetchAssets()
        XCTAssertTrue(box.changeCount == 3)
    }
}
