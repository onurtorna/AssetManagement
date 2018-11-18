//
//  AssignAssetToEmployeeDataController.swift
//  AssetManagement
//
//  Created by Onur Torna on 18.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import Foundation

final class AssignAssetToEmployeeDataController: AssignAssetToEmployeeProtocol {

    func assignAssetToEmployee(assetId: Int,
                               employeeId: Int,
                               completion: @escaping ((Error?) -> Void)) {

        APIClient.assingAssetToEmployee(assetId: assetId,
                                        employeeId: employeeId) { (error) in
                                            completion(error)
        }
    }

    func fetchAllAssets(completion: @escaping ([Asset]?, Error?) -> Void) {

        APIClient.getAllAssets { (assetList, error) in
            completion(assetList, error)
        }
    }
}
