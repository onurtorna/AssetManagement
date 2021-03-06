//
//  UIColor+Additions.swift
//  AssetManagement
//
//  Created by Onur Torna on 17.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import UIKit

extension UIColor {

    class var lightBlue: UIColor {
        return UIColor.with(red: 0, green: 119, blue: 181)
    }

    class var slateBlue: UIColor {
        return UIColor.with(red: 88, green: 111, blue: 143)
    }

    class var aquaGreen: UIColor {
        return UIColor.with(red: 18, green: 201, blue: 144)
    }

    class var separator: UIColor {
        return UIColor.with(red: 222, green: 222, blue: 222)
    }

    /// Creates and returns UIColor with given parameters
    ///
    /// - Parameters:
    ///   - red: Red value
    ///   - green: Green value
    ///   - blue: Blue value
    ///   - alpha: Alpha value
    /// - Returns: UIColor with specified parameters
    static func with(red: CGFloat,
                     green: CGFloat,
                     blue: CGFloat,
                     alpha: CGFloat = 1.0) -> UIColor {

        return UIColor(red: red / 255.0,
                       green: green / 255.0,
                       blue: blue / 255.0,
                       alpha: alpha)
    }
}
