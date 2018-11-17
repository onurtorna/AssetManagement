//
//  UIView+Separator.swift
//  AssetManagement
//
//  Created by Onur Torna on 17.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import UIKit

private enum Constant {

    static let topSeparatorTag = -5278
    static let bottomSeparatorTag = 19773
}

extension UIView {

    func addVerticalSeparators(leftMargin: CGFloat = 0,
                               rightMargin: CGFloat = 0,
                               color: UIColor = .separator) {

        addSeparatorAtTop(leftMargin: leftMargin,
                          rightMargin: rightMargin,
                          color: color)

        addSeparatorAtBottom(leftMargin: leftMargin,
                             rightMargin: rightMargin,
                             color: color)
    }

    func addSeparatorAtTop(leftMargin: CGFloat = 0,
                           rightMargin: CGFloat = 0,
                           color: UIColor = .separator) {

        removeSeparatorAtTop()

        let separatorView = UIView()
        separatorView.tag = Constant.topSeparatorTag
        separatorView.backgroundColor = color
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(separatorView)

        separatorView.pinTop(toTopOf: self, constant: 0)
        separatorView.pinLeading(toLeadingOf: self, constant: leftMargin)
        separatorView.pinTrailing(toTrailingOf: self, constant: rightMargin)
        separatorView.setHeight(to: 1)
    }

    func addSeparatorAtBottom(leftMargin: CGFloat = 0,
                              rightMargin: CGFloat = 0,
                              color: UIColor = .separator) {

        removeSeparatorAtBottom()

        let separatorView = UIView()
        separatorView.tag = Constant.bottomSeparatorTag
        separatorView.backgroundColor = color
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(separatorView)

        separatorView.pinBottom(toBottomOf: self, constant: 0)
        separatorView.pinLeading(toLeadingOf: self, constant: -leftMargin)
        separatorView.pinTrailing(toTrailingOf: self, constant: -rightMargin)
        separatorView.setHeight(to: 1)
    }

    func removeSeparatorAtTop() {

        if let subview = subview(with: Constant.topSeparatorTag) {
            subview.removeFromSuperview()
        }
    }

    func removeSeparatorAtBottom() {

        if let subview = subview(with: Constant.bottomSeparatorTag) {
            subview.removeFromSuperview()
        }
    }

    /// Returns view with tag in subviews. Not recursive as built in view(with tag:) method
    ///
    /// - Parameter tag: Tag of the searched subview
    /// - Returns: Subview with tag if any
    func subview(with tag: Int) -> UIView? {

        for view in subviews where view.tag == tag {
            return view
        }

        return nil
    }

}
