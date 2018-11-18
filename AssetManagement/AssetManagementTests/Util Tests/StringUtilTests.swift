//
//  StringUtilTests.swift
//  AssetManagementTests
//
//  Created by Onur Torna on 19.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import XCTest
@testable import AssetManagement

class StringUtilTests: XCTestCase {

    func testServiceTimeToDateString() {

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"

        let timeString = "2018-11-18T13:54:04"
        if let date = dateFormatter.date(from: timeString) {

            let output = StringUtils.convertServiceTimeDateString(inputDate: date)
            XCTAssertTrue(output == "18/11/2018 · 01:54")
        }

        let secondTimeString = "2016-09-01T01:22:07"
        if let date = dateFormatter.date(from: secondTimeString) {

            let output = StringUtils.convertServiceTimeDateString(inputDate: date)
            XCTAssertTrue(output == "01/09/2016 · 01:22")
        }

        let thirdTimeString = "2011-10-10T12:00:00"
        if let date = dateFormatter.date(from: thirdTimeString) {

            let output = StringUtils.convertServiceTimeDateString(inputDate: date)
            XCTAssertTrue(output == "10/10/2011 · 12:00")
        }
    }
}
