//
//  AssignAssetToEmployeeRequest.swift
//  AssetManagement
//
//  Created by Onur Torna on 18.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import Alamofire

final class AssignAssetToEmployeeRequest {

    private enum Mapping {
        static let employeeIdKey = "employeeId"
    }

    static func generateParameters(employeeId: Int) -> Parameters {

        var parameters: Parameters = [:]
        parameters.addObjectIfExists(key: Mapping.employeeIdKey, object: employeeId)
        return parameters
    }
}
