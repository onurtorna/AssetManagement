//
//  AssetListDataProtocol.swift
//  AssetManagement
//
//  Created by Onur Torna on 18.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import Foundation

protocol AssetListDataProtocol {

    /// Fetches all assets at that time
    ///
    /// - Parameter completion: Completion Block
    func fetchAllAssets(completion: @escaping ([Asset]?, Error?) -> Void)
}
