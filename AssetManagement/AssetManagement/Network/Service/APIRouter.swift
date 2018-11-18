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

    case employee(id: Int)

    case createEmployee(fullName: String?)

    case allEmployees

    case allAssets

    case createAsset(name: String?,
        notes: String?,
        serialNumber: String?)

    case assignAssetToEmployee(assetId: Int, employeeId: Int)

    case allRecords

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
        case .login,
             .createEmployee,
             .createAsset:
            return .post

        case .allEmployees,
             .employee,
             .allAssets,
             .allRecords:
            return .get

        case .assignAssetToEmployee:
            return .patch
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

        case .allEmployees:
            return "employees"

        case let .employee(id: id):
            return "employees/\(id)"

        case .createEmployee:
            return "employees"

        case .allAssets:
            return "assets"

        case .createAsset:
            return "assets"

        case let .assignAssetToEmployee(assetId: assetId, employeeId: _):
            return "assets/\(assetId)" 

        case .allRecords:
            return "records"
        }
    }

    /// Mark: Headers
    private var headers: [String: String] {
        var headers: [String: String] = [:]

        if let authenticationToken = SessionManager.shared.authentiactionToken {
            headers[HTTPHeader.Field.authorization] = HTTPHeader.Value.authorizationPrefix + authenticationToken
        }

        return headers
    }

    private var parameters: Parameters? {

        switch self {
        case let .login(email: email, password: password):
            return LoginRequest.generateParameters(email: email,
                                                   password: password)

        case .createEmployee(fullName: let name):
            return CreateEmployeeRequest.generateParameters(name: name)

        case let .createAsset(name: name, notes: notes, serialNumber: serialNumber):
            return CreateAssetRequest.generateParameters(name: name,
                                                         notes: notes,
                                                         serialNumber: serialNumber)

        case .assignAssetToEmployee(assetId: _, employeeId: let employeeId):
            return AssignAssetToEmployeeRequest.generateParameters(employeeId: employeeId)

        case .employee,
             .allEmployees,
             .allAssets,
             .allRecords:
            return nil
        }
    }
}

