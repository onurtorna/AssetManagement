//
//  EmployeeListDummyDataController.swift
//  AssetManagementTests
//
//  Created by Onur Torna on 18.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import Foundation
@testable import AssetManagement

final class EmployeeListDummyDataController: EmployeeListDataProtocol {

    func fetchAllEmployees(completion: @escaping (([User]?, Error?) -> Void)) {
        let firstUser = User(id: 1, name: "first", email: "yahoo")
        let secondUser = User(id: 6, name: "second", email: "gmail")
        let thirdUser = User(id: 7, name: "third", email: "hotmail")
        completion([firstUser, secondUser, thirdUser], nil)
    }
}
