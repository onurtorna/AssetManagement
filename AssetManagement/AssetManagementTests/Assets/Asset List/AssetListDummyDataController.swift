//
//  AssetListDummyDataController.swift
//  AssetManagementTests
//
//  Created by Onur Torna on 18.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import Foundation
@testable import AssetManagement

final class AssetListDummyDataController: AssetListDataProtocol {

    func fetchAllAssets(completion: @escaping ([Asset]?, Error?) -> Void) {

        let asset = Asset(id: 1,
                          name: "name",
                          notes: "surname",
                          serialNumber: "1234",
                          employeeId: 2)
        let secondAsset = Asset(id: 9,
                                name: "name",
                                notes: "surname",
                                serialNumber: "3456",
                                employeeId: 4)
        completion([asset, secondAsset], nil)

    }
}
