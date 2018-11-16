//
//  LoginRequest.swift
//  AssetManagement
//
//  Created by Onur Torna on 17.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import Alamofire

final class LoginRequest {

    private enum Mapping {
        static let emailKey = "email"
        static let passwordKey = "password"
    }

    static func generateParameters(email: String?,
                                   password: String?) -> Parameters {

        var parameters: Parameters = [:]
        parameters.addObjectIfExists(key: Mapping.emailKey, object: email)
        parameters.addObjectIfExists(key: Mapping.passwordKey, object: password)
        return parameters
    }

}
