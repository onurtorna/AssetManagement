//
//  RecordHistoryDummyDataController.swift
//  AssetManagementTests
//
//  Created by Onur Torna on 19.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import Foundation
@testable import AssetManagement

final class RecordHistoryDummyDataController: RecordHistoryDataProtocol {

    func fetchAllRecords(completion: @escaping (([Record]?, Error?) -> Void)) {
        let firstRecord = Record(id: 1, date: Date(), fromEmployeeId: 2, toEmployeeId: 3, assetId: 4)
        let secondRecord = Record(id: 5, date: Date(), fromEmployeeId: 1, toEmployeeId: 6, assetId: 7)
        let thirdRecord = Record(id: 11, date: Date(), fromEmployeeId: 5, toEmployeeId: 1, assetId: 7)
        completion([firstRecord, secondRecord, thirdRecord], nil)
    }
}

