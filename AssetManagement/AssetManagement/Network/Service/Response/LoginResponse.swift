//
//  LoginResponse.swift
//  AssetManagement
//
//  Created by Onur Torna on 17.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import Foundation

final class LoginResponse: Response {

    /// Logged in user
    var user: User?

    /// Authentication token
    var token: String?
}
