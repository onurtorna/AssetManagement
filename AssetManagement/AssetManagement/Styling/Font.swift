//
//  Font.swift
//  AssetManagement
//
//  Created by Onur Torna on 18.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import UIKit

enum Font: String {

    case regular = "ArialMT"
    case bold = "Arial-BoldMT"

    func with(size: CGFloat) -> UIFont {
        return UIFont(name: rawValue, size: size)!
    }
}
