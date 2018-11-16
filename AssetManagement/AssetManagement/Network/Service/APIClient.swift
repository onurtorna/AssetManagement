//
//  APIClient.swift
//  AssetManagement
//
//  Created by Onur Torna on 16.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//


import Alamofire

final class APIClient {

    static func login(email: String?,
                      password: String?,
                      completion: @escaping (LoginResponse?, Error?) -> Void) {

        APIRouter.login(email: email,
                        password: password).request.responseJSON { (dataResponse) in

                            ServiceManager.handleResponse(dataResponse,
                                                          of: LoginResponse.self,
                                                          completion: completion)
        }
    }

}
