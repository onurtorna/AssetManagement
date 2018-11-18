//
//  CreateAssetRequest.swift
//  AssetManagement
//
//  Created by Onur Torna on 18.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import Alamofire

final class CreateAssetRequest {

    private enum Mapping {
        static let nameKey = "name"
        static let notesKey = "notes"
        static let serialNumberKey = "serialNumber"
    }

    static func generateParameters(name: String?,
                                   notes: String?,
                                   serialNumber: String?) -> Parameters {

        var parameters: Parameters = [:]
        parameters.addObjectIfExists(key: Mapping.nameKey, object: name)
        parameters.addObjectIfExists(key: Mapping.notesKey, object: notes)
        parameters.addObjectIfExists(key: Mapping.serialNumberKey, object: serialNumber)
        return parameters
    }

}
