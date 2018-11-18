//
//  RecordHistoryDataController.swift
//  AssetManagement
//
//  Created by Onur Torna on 18.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import Foundation

final class RecordHistoryDataController: RecordHistoryDataProtocol {

    func fetchAllRecords(completion: @escaping (([Record]?, Error?) -> Void)) {

        APIClient.fetchAllRecords { (records, error) in
            completion(records, error)
        }
    }
}
