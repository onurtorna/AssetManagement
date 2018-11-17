//
//  Asset.swift
//  AssetManagement
//
//  Created by Onur Torna on 17.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import Foundation

struct Asset: Codable {

    /// Unique id of the asset
    var id: Int

    /// Name of the asset
    var name: String

    /// Notes for the assets
    var notes: String?

    /// Serial number of the asset
    var serialNumber: String

    /// Id of the employee who holds the asset at the moment
    var employeeId: Int
}
