//
//  UIViewController+Toaster.swift
//  AssetManagement
//
//  Created by Onur Torna on 17.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import UIKit

extension UIViewController {

    func showToaster(type: AMToastView.ToastType,
                     text: String?) {

        AMToastView.show(in: view,
                         text: text,
                         type: type)
    }
}
