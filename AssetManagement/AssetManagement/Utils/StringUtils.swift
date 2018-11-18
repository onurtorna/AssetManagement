//
//  StringUtils.swift
//  AssetManagement
//
//  Created by Onur Torna on 18.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import Foundation

struct StringUtils {

    /// Converts given time string to formatted time string
    ///
    /// - Parameters:
    ///   - timeString: Input time string to convert
    ///   - inputFormat: Input format
    ///   - outputFormat: Output format
    /// - Returns: Converted time string
    static func convertServiceTimeDateString(inputDate: Date,
                                             outputFormat: String = "dd/MM/yyyy · hh:mm") -> String {

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = outputFormat
        let formattedString = dateFormatter.string(from: inputDate)
        return formattedString
    }
}
