//
//  AssignAssetToEmployeeTests.swift
//  AssetManagementTests
//
//  Created by Onur Torna on 19.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import XCTest
@testable import AssetManagement

private class Box {
    let viewModel: AssignAssetToEmployeeViewModel
    var state = AssignAssetToEmployeeState(employee: User(id: 1, name: "name", email: "email"))

    var changeCount = 0

    init(with dataController: AssignAssetToEmployeeProtocol = AssignAssetToEmployeeDummyDataController()) {
        viewModel = AssignAssetToEmployeeViewModel(employee: User(id: 1, name: "name", email: "email"),
                                                   dataController: dataController)

        viewModel.stateChangeHandler = { [unowned self] in
            switch $0 {
            case .error:
                self.changeCount += 1
            case .loading:
                self.changeCount += 1
            case .assetsFetch:
                self.changeCount += 1
            case .initialPublish(_):
                self.changeCount += 1
            case .success:
                self.changeCount += 1
            }
        }
    }
}

class AssignAssetToEmployeeTests: XCTestCase {

    func testAssetCount() {
        let box = Box()
        box.viewModel.fetchAssets()
        XCTAssertTrue(box.viewModel.assetCount == 3)
    }

    func testSpecificItemFetch() {
        let box = Box()
        box.viewModel.fetchAssets()
        XCTAssertTrue(box.viewModel.asset(at: 1)?.id == 5)
    }

    func testChangeCount() {
        let box = Box()
        box.viewModel.fetchAssets()
        XCTAssertTrue(box.changeCount == 4)
    }
}


