//
//  Dictionary+JSON.swift
//  AssetManagement
//
//  Created by Onur Torna on 17.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import Foundation

extension Dictionary where Key == String {

    mutating func addObjectIfExists(key: String,
                                    object: Value?) {

        guard let object = object else { return }

        self[key] = object
    }
}
