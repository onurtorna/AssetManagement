//
//  AddNewEmployeeDataProtocol.swift
//  AssetManagement
//
//  Created by Onur Torna on 18.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import Foundation

protocol AddNewEmployeeDataProtocol {

    /// Creates new employee with given name
    ///
    /// - Parameters:
    ///   - name: Name of the new employee
    ///   - completion: Completion block
    func createEmployee(name: String?,
                        completion: @escaping ((User?, Error?) -> Void))
}
