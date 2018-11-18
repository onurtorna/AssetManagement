//
//  AssignAssetToEmployeeDummyDataController.swift
//  AssetManagementTests
//
//  Created by Onur Torna on 19.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import Foundation
@testable import AssetManagement

final class AssignAssetToEmployeeDummyDataController: AssignAssetToEmployeeProtocol {

    func assignAssetToEmployee(assetId: Int,
                               employeeId: Int,
                               completion: @escaping ((Error?) -> Void)) {
        completion(nil)
    }

    func fetchAllAssets(completion: @escaping ([Asset]?, Error?) -> Void) {

        let firstAsset = Asset(id: 3,
                               name: "name",
                               notes: "surname",
                               serialNumber: "1234",
                               employeeId: 3)
        let secondAsset = Asset(id: 5,
                                name: "name",
                                notes: "surname",
                                serialNumber: "1234",
                                employeeId: 5)
        let thirdAsset = Asset(id: 7,
                               name: "name",
                               notes: "surname",
                               serialNumber: "1234",
                               employeeId: 7)
        let assetList = [firstAsset, secondAsset, thirdAsset]
        completion(assetList, nil)
    }
}
