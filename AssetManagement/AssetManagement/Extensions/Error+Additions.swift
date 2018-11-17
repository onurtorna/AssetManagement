//
//  Error+Additions.swift
//  AssetManagement
//
//  Created by Onur Torna on 17.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import Foundation

extension Error {

    /// Error message to show to user
    var am_message: String? {
        let error = self as NSError
        return error.userInfo[Global.ErrorKey.message] as? String
    }
}
