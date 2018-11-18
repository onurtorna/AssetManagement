//
//  AddAssetTests.swift
//  AssetManagementTests
//
//  Created by Onur Torna on 19.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import XCTest
@testable import AssetManagement

private class Box {
    let viewModel: AddAssetViewModel
    var state = AddAssetState()

    var changeCount = 0
    var success: Bool = false

    init(with dataController: AddAssetDataProtocol = AddAssetDummyDataController()) {
        viewModel = AddAssetViewModel(dataController: dataController)

        viewModel.stateChangeHandler = { [unowned self] in
            switch $0 {
            case .error:
                self.changeCount += 1
            case .loading:
                self.changeCount += 1
            case .success:
                self.success = true
                self.changeCount += 1
            }
        }
    }
}

class AddAssetTests: XCTestCase {

    func testLogin() {
        let box = Box()
        box.viewModel.addAsset(name: "name",
                               notes: "note",
                               serialNumber: "serialNumber")
        XCTAssertTrue(box.success)
    }

    func testChangeCount() {
        let box = Box()
        box.viewModel.addAsset(name: "name",
                               notes: "note",
                               serialNumber: "serialNumber")
        XCTAssertTrue(box.changeCount == 3)
    }
}

