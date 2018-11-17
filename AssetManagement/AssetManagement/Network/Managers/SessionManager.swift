//
//  SessionManager.swift
//  AssetManagement
//
//  Created by Onur Torna on 17.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import Foundation

final class SessionManager {

    static let shared = SessionManager()

    /// Current logged in user
    var user: User?

    /// Authentication token of the user if he/she is logged in
    var authentiactionToken: String?
}
