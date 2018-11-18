//
//  EmployeeListTests.swift
//  AssetManagementTests
//
//  Created by Onur Torna on 18.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import XCTest
@testable import AssetManagement

private class Box {
    let viewModel: EmployeeListViewModel
    var state = EmployeeListState()

    var changeCount = 0

    init(with dataController: EmployeeListDataProtocol = EmployeeListDummyDataController()) {
        viewModel = EmployeeListViewModel(dataController: dataController)

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

class EmployeeListTests: XCTestCase {

    func testListFetching() {
        let box = Box()
        box.viewModel.fetchEmployees()
        XCTAssertTrue(box.viewModel.employeeCount == 3)
    }

    func testSpecificItemFetch() {
        let box = Box()
        box.viewModel.fetchEmployees()
        XCTAssertTrue(box.viewModel.employee(at: 2)?.email == "hotmail")
    }

    func testChangeCount() {
        let box = Box()
        box.viewModel.fetchEmployees()
        XCTAssertTrue(box.changeCount == 3)
    }
}

