//
//  AddAssetDummyDataController.swift
//  AssetManagementTests
//
//  Created by Onur Torna on 18.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import Foundation
@testable import AssetManagement

final class AddAssetDummyDataController: AddAssetDataProtocol {

    func createAsset(name: String?,
                     notes: String?,
                     serialNumber: String?,
                     completion: @escaping (Asset?, Error?) -> Void) {

        let asset = Asset(id: 3,
                          name: "name",
                          notes: "note",
                          serialNumber: "serialNumber",
                          employeeId: nil)
        completion(asset, nil)
    }
}
