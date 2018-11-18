//
//  ButtonCustomizer.swift
//  AssetManagement
//
//  Created by Onur Torna on 18.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import UIKit

final class ButtonCustomizer {

    static func applyRoundedStyling(to button: UIButton,
                                    color: UIColor) {

        button.layer.cornerRadius = button.frame.size.height / 2
        button.backgroundColor = color
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 16)
    }
}
