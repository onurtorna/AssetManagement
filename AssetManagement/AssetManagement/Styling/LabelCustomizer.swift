//
//  LabelCustomizer.swift
//  AssetManagement
//
//  Created by Onur Torna on 18.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import UIKit

final class LabelCustomizer {

    /// Applies font to given label
    ///
    /// - Parameters:
    ///   - label: Label to customize
    ///   - font: Font type
    ///   - size: Font size
    ///   - color: Text color
    static func applyFont(label: UILabel?,
                          font: Font = .regular,
                          size: CGFloat,
                          color: UIColor = UIColor.slateBlue) {

        guard let label = label else { return }

        label.font = font.with(size: size)
        label.textColor = color
    }

}
