//
//  AssignAssetToEmployeeDataProtocol.swift
//  AssetManagement
//
//  Created by Onur Torna on 18.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import Foundation

protocol AssignAssetToEmployeeProtocol {

    /// Assigns specific asset to the employee
    func assignAssetToEmployee(assetId: Int,
                               employeeId: Int,
                               completion: @escaping ((Error?) -> Void))

    /// Lists all assets
    func fetchAllAssets(completion: @escaping ([Asset]?, Error?) -> Void)
}
