//
//  AddNewEmployeeDataController.swift
//  AssetManagement
//
//  Created by Onur Torna on 18.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import Foundation

final class AddNewEmployeeDataController: AddNewEmployeeDataProtocol {

    func createEmployee(name: String?,
                        completion: @escaping ((User?, Error?) -> Void)) {

        APIClient.createEmployee(name: name) { (user, error) in

            completion(user, error)
        }
    }
}
