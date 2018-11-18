//
//  AMToastView.swift
//  AssetManagement
//
//  Created by Onur Torna on 17.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import UIKit
import Toast_Swift

class AMToastView {

    enum ToastType {
        case warning
        case error
        case success

        var image: UIImage {

            switch self {
            case .warning:
                return #imageLiteral(resourceName: "toast_warning")
            case .error:
                return #imageLiteral(resourceName: "toast_error")
            case .success:
                return #imageLiteral(resourceName: "toast_success")
            }
        }
    }

    static var style: ToastStyle {
        var style = ToastStyle()


        style.backgroundColor = .lightBlue
        style.titleColor = .white
        style.messageFont = .systemFont(ofSize: 14)
        style.titleFont = .systemFont(ofSize: 14)
        style.horizontalPadding = 12
        style.messageNumberOfLines = 0
        style.imageSize = CGSize(width: 22, height: 22)
        style.messageAlignment = .center
        style.fadeDuration = 1
        return style
    }

    static func show(in view: UIView,
                     text: String?,
                     type: AMToastView.ToastType) {

        view.makeToast(text,
                       duration: 2.0,
                       position: .top,
                       title: nil,
                       image: type.image,
                       style: style,
                       completion: nil)
    }
}
