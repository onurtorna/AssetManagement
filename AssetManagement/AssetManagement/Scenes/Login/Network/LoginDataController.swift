//
//  LoginDataController.swift
//  AssetManagement
//
//  Created by Onur Torna on 17.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import Foundation

final class LoginDataController: LoginDataProtocol {

    func login(email: String?,
               password: String?,
               completion: @escaping ((User?, String?, Error?) -> Void)) {

        APIClient.login(email: email,
                        password: password) { (response, error) in

                            completion(response?.user, response?.token, error)
        }
    }
}
