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

    /// Defines if this record is a receive action for specific user
    var isReceiveRecord: Bool = false

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        let dateString = try values.decode(String.self, forKey: .date)
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        date = formatter.date(from: dateString) ?? Date()

        id = try values.decode(Int.self, forKey: .fromEmployeeId)
        fromEmployeeId = try values.decode(Int.self, forKey: .fromEmployeeId)
        toEmployeeId = try values.decode(Int.self, forKey: .toEmployeeId)
        assetId = try values.decode(Int.self, forKey: .assetId)
    }

    init(id: Int, date: Date, fromEmployeeId: Int, toEmployeeId: Int, assetId: Int) {
        self.id = id
        self.date = date
        self.fromEmployeeId = fromEmployeeId
        self.toEmployeeId = toEmployeeId
        self.assetId = assetId
    }

    enum CodingKeys: String, CodingKey {
        case id
        case date
        case fromEmployeeId
        case toEmployeeId
        case assetId
    }
}
