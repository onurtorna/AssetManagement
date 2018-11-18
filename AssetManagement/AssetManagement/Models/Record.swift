//
//  Record.swift
//  AssetManagement
//
//  Created by Onur Torna on 18.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import Foundation

struct Record: Codable {

    /// Unique Id of the record
    var id: Int

    /// Record date
    var date: Date

    /// Id of the employee who used to own the asset
    var fromEmployeeId: Int

    /// Id of the employee who received the asset
    var toEmployeeId: Int

    /// Assigned asset Id
    var assetId: Int
}
