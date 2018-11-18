//
//  AddAssetDataController.swift
//  AssetManagement
//
//  Created by Onur Torna on 18.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import Foundation

final class AddAssetDataController: AddAssetDataProtocol {

    func createAsset(name: String?,
                     notes: String?,
                     serialNumber: String?,
                     completion: @escaping (Asset?, Error?) -> Void) {

        APIClient.createAsset(name: name,
                              notes: notes,
                              serialNumber: serialNumber) { (asset, error) in

                                completion(asset, error)
        }
    }
}
