//
//  EmployeeListDataController.swift
//  AssetManagement
//
//  Created by Onur Torna on 17.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import Foundation

final class EmployeeListDataController: EmployeeListDataProtocol {

    func fetchAllEmployees(completion: @escaping (([User]?, Error?) -> Void)) {

        APIClient.getAllEmployees { (response, error) in
            completion(response?.employeeList, error)
        }
    }
}
