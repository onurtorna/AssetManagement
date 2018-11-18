//
//  CreateEmployeeRequest.swift
//  AssetManagement
//
//  Created by Onur Torna on 18.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import Alamofire

final class CreateEmployeeRequest {

    private enum Mapping {
        static let nameKey = "name"
    }

    static func generateParameters(name: String?) -> Parameters {

        var parameters: Parameters = [:]
        parameters.addObjectIfExists(key: Mapping.nameKey, object: name)
        return parameters
    }

}
