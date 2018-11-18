//
//  LoginTests.swift
//  AssetManagementTests
//
//  Created by Onur Torna on 18.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import XCTest
@testable import AssetManagement

private class Box {
    let viewModel: LoginViewModel
    var state = LoginState()

    var changeCount = 0
    var success: Bool = false

    init(with dataController: LoginDataProtocol = LoginDummyDataController()) {
        viewModel = LoginViewModel(dataController: dataController)

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

class LoginTests: XCTestCase {

    func testLogin() {
        let box = Box()
        box.viewModel.login()
        XCTAssertTrue(box.success)
    }

    func testChangeCount() {
        let box = Box()
        box.viewModel.login()
        XCTAssertTrue(box.changeCount == 3)
    }
}
