//
//  UIViewController+LoadingView.swift
//  AssetManagement
//
//  Created by Onur Torna on 17.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import UIKit

extension UIViewController {

    func showLoading(_ isLoading: Bool) {

        if isLoading {
            showLoadingView()
        } else {
            hideLoadingView()
        }
    }

    func showLoadingView() {

        for case _ as LoadingView in self.view.subviews {
            // Loading is already active
            return
        }

        let loadingView = LoadingView.loadFromNib()
        loadingView.showIn(view: view)
    }

    func hideLoadingView() {

        for case let loadingView as LoadingView in self.view.subviews {
            loadingView.removeFromSuperview()
        }
    }
}
