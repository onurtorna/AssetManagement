//
//  LoginDataProtocol.swift
//  AssetManagement
//
//  Created by Onur Torna on 17.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import Foundation

protocol LoginDataProtocol {

    /// Logins to management portal with given credentials
    ///
    /// - Parameters:
    ///   - email: Email of the user
    ///   - password: password of the user
    ///   - completion: Completion Block
    func login(email: String?,
               password: String?,
               completion: @escaping ((Error?) -> Void))
}
