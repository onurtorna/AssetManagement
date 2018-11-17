//
//  User.swift
//  AssetManagement
//
//  Created by Onur Torna on 17.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import Foundation

struct User: Codable {

    /// Unique ID of the user
    var id: Int

    /// Name of the user
    var name: String

    /// Email of the user
    var email: String?
}
