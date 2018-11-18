//
//  RecordHistoryDataProtocol.swift
//  AssetManagement
//
//  Created by Onur Torna on 18.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import Foundation

protocol RecordHistoryDataProtocol {

    /// Fetches all asset interaction records
    func fetchAllRecords(completion: @escaping (([Record]?, Error?) -> Void))
}
