//
//  AssetListDataController.swift
//  AssetManagement
//
//  Created by Onur Torna on 18.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import Foundation

final class AssetListDataController: AssetListDataProtocol {

    func fetchAllAssets(completion: @escaping ([Asset]?, Error?) -> Void) {

        APIClient.getAllAssets { (assetList, error) in
            completion(assetList, error)
        }
    }
}
