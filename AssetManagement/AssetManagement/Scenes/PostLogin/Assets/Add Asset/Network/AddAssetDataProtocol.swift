//
//  AddAssetDataProtocol.swift
//  AssetManagement
//
//  Created by Onur Torna on 18.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import Foundation

protocol AddAssetDataProtocol {

    /// Creates new asset with specified information
    ///
    /// - Parameters:
    ///   - name: Name of the asset
    ///   - notes: Notes related to asset
    ///   - serialNumber: Serial number of asset
    ///   - completion: Completion Block
    func createAsset(name: String?,
                     notes: String?,
                     serialNumber: String?,
                     completion: @escaping (Asset?, Error?) -> Void)
}
