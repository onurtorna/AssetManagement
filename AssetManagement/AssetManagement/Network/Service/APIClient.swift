//
//  APIClient.swift
//  AssetManagement
//
//  Created by Onur Torna on 16.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//


import Alamofire

final class APIClient { }

// MARK: - Login
extension APIClient {
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

// MARK: - Get all employees
extension APIClient {

    static func getAllEmployees(completion: @escaping ([User]?, Error?) -> Void) {

        APIRouter.allEmployees.request.responseJSON { (dataResponse) in

            ServiceManager.handleResponse(dataResponse,
                                          of: [User].self,
                                          completion: completion)
        }
    }
}

// MARK: - Get Specific Employee
extension APIClient {

    static func getEmployee(id: Int,
                            completion: @escaping (User?, Error?) -> Void) {

        APIRouter.employee(id: id).request.responseJSON { (dataResponse) in

            ServiceManager.handleResponse(dataResponse,
                                          of: User.self,
                                          completion: completion)
        }
    }
}

// MARK: - Create employee
extension APIClient {

    static func createEmployee(name: String?,
                               completion: @escaping (User?, Error?) -> Void) {

        APIRouter.createEmployee(fullName: name).request.responseJSON { (dataResponse) in

            ServiceManager.handleResponse(dataResponse,
                                          of: User.self,
                                          completion: completion)
        }
    }
}

// MARK: - Get all assetss
extension APIClient {

    static func getAllAssets(completion: @escaping ([Asset]?, Error?) -> Void) {

        APIRouter.allAssets.request.responseJSON { (dataResponse) in

            ServiceManager.handleResponse(dataResponse,
                                          of: [Asset].self,
                                          completion: completion)
        }
    }
}

// MARK: - Create asset
extension APIClient {

    static func createAsset(name: String?,
                            notes: String?,
                            serialNumber: String?,
                            completion: @escaping (Asset?, Error?) -> Void) {

        APIRouter.createAsset(name: name,
                              notes: notes,
                              serialNumber: serialNumber)
            .request.responseJSON { (dataResponse) in

                ServiceManager.handleResponse(dataResponse,
                                              of: Asset.self,
                                              completion: completion)
        }
    }
}

// MARK: - Assign Asset to Employee
extension APIClient {

    static func assingAssetToEmployee(assetId: Int,
                                      employeeId: Int,
                                      completion: @escaping ((Error?) -> Void)) {

        APIRouter.assignAssetToEmployee(assetId: assetId,
                                        employeeId: employeeId)
            .request.responseJSON { (dataResponse) in

                let error = ErrorHandler.error(from: dataResponse)
                guard error?.am_message == nil else {
                        completion(error)
                        return
                }

                completion(nil)
        }
    }
}

// MARK: - All records
extension APIClient {

    static func fetchAllAssets(completion: @escaping (([Record]?, Error?) -> Void)) {

        APIRouter.allAssets.request.responseJSON { (dataResponse) in

            ServiceManager.handleResponse(dataResponse,
                                          of: [Record].self,
                                          completion: completion)
        }
    }
}
