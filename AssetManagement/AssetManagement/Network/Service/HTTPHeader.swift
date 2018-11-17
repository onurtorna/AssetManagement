//
//  HTTPHeader.swift
//  AssetManagement
//
//  Created by Onur Torna on 17.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import Foundation

enum HTTPHeader {
    enum Field {
        static let authorization = "Authorization"
    }

    enum Value {
        static let authorizationPrefix = "Bearer "
    }
}
