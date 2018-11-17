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
    static func getAllEmployees(completion: @escaping (AllEmployeesResponse?, Error?) -> Void) {

        APIRouter.allEmployees.request.responseJSON { (dataResponse) in

            ServiceManager.handleResponse(dataResponse,
                                          of: AllEmployeesResponse.self,
                                          completion: completion)
        }
    }
}

// MARK: - Get Specific Employee
extension APIClient {

    static func getEmployee(id: Int,
                            completion: @escaping (EmployeeRepsonse?, Error?) -> Void) {

        APIRouter.employee(id: id).request.responseJSON { (dataResponse) in

            ServiceManager.handleResponse(dataResponse,
                                          of: EmployeeRepsonse.self,
                                          completion: completion)
        }
    }
}
