//
//  LoginDummyDataController.swift
//  AssetManagementTests
//
//  Created by Onur Torna on 18.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import Foundation
@testable import AssetManagement

final class LoginDummyDataController: LoginDataProtocol {

    func login(email: String?,
               password: String?,
               completion: @escaping ((User?, String?, Error?) -> Void)) {

        let employee = User(id: 1, name: "John", email: "John@Doe.com")
        completion(employee, "token", nil)
    }
}
