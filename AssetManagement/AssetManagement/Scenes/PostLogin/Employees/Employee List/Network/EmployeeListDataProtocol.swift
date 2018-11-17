//
//  EmployeeListDataProtocol.swift
//  AssetManagement
//
//  Created by Onur Torna on 17.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import Foundation

protocol EmployeeListDataProtocol {

    /// Fetches all employees at that moment
    ///
    /// - Parameter completion: Completion Block
    func fetchAllEmployees(completion: @escaping (([User]?, Error?) -> Void))
}
