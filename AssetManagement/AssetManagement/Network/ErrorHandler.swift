//
//  ErrorHandler.swift
//  AssetManagement
//
//  Created by Onur Torna on 16.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import Alamofire

class ErrorHandler {

    static let decoder = JSONDecoder()

    private enum ErrorConstant {
        static let httpErrorDomain = "HTTP response error"
        static let httpErrorDescriptionTitle = "HTTP response"
        static let dataParseErrorDescriptionTitle = "Data parse"
        static let serializationErrorDomain = "Serialization error"
        static let serializationErrorDescriptionTitle = "Serialization"
    }

    /// Generic serialization error
    static var serializationError: Error {

        let description = ErrorConstant.serializationErrorDescriptionTitle
        let error = NSError(domain: ErrorConstant.serializationErrorDomain,
                            code: 0,
                            userInfo: [NSLocalizedDescriptionKey: description])

        return error
    }

    /// Generates error from Alamofire Data Response if there is a problem
    ///
    /// - Parameter response: Alamofire data response
    /// - Returns: Error if there is a problem, nil otherwise
    static func error(from response: Alamofire.DataResponse<Any>) -> Error? {

        var error = response.error

        guard response.data != nil else {
            return ErrorHandler.genericError()
        }

        if let httpResponse = response.response {
            if httpResponse.statusCode < 200 || httpResponse.statusCode >= 300 {
                let description = "\(ErrorConstant.httpErrorDescriptionTitle) : \(httpResponse.statusCode)"

                if let data = response.data {

                    do {
                        let amError: AMError = try decoder.decode(AMError.self,
                                                                  from: data)

                        var userInfo: [String: Any] = [NSLocalizedDescriptionKey: description]
                        userInfo[Global.ErrorKey.message] = amError.message

                        error = NSError(domain: ErrorConstant.httpErrorDomain,
                                        code: 0,
                                        userInfo: userInfo)

                    } catch {
                        return ErrorHandler.genericError(description: description)
                    }
                }
            }
        }

        return error
    }
}

// MARK: - Helpers
private extension ErrorHandler {

    static func genericError(description: String = ErrorConstant.dataParseErrorDescriptionTitle) -> NSError {

        return NSError(domain: ErrorConstant.httpErrorDomain,
                       code: 0,
                       userInfo: [NSLocalizedDescriptionKey: description])
    }
}

