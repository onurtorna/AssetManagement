//
//  APIRouter.swift
//  AssetManagement
//
//  Created by Onur Torna on 16.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import Alamofire

enum APIRouter {

    case login(email: String?, password: String?)

    // MARK: - Request
    var request: Alamofire.DataRequest {

        var encodingMethod: ParameterEncoding = URLEncoding.default
        if method == .post {
            encodingMethod = JSONEncoding.default
        }

        return NetworkManager.sessionManager.request(url!,
                                                     method: method,
                                                     parameters: parameters,
                                                     encoding: encodingMethod,
                                                     headers: headers)
    }

    // MARK: - HTTPMethod
    var method: HTTPMethod {

        switch self {
        case .login:
            return .post
        }
    }

    // MARK: - URL
    private var url: URL? {
        let baseUrl = URL(string: Network.StaticUrl.base)
        let url = baseUrl?.appendingPathComponent(path)
        return url
    }

    // MARK: - PATH
    private var path: String {

        switch self {
        case .login:
            return "users/login"

        }
    }

    /// Mark: Headers
    private var headers: [String: String] {
        // Headers can be added here
        return [:]
    }

    private var parameters: Parameters? {

        switch self {
        case let .login(email: email, password: password):
            return LoginRequest.generateParameters(email: email,
                                                   password: password)
        }
    }
}

