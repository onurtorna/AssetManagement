//
//  LoadingView.swift
//  AssetManagement
//
//  Created by Onur Torna on 17.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import UIKit

final class LoadingView: AMView {

    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!

    override func awakeFromNib() {
        super.awakeFromNib()

        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor.black.withAlphaComponent(0.6)

        activityIndicator.startAnimating()
    }
}

// MARK: - Public
extension LoadingView {

    func showIn(view: UIView?) {

        guard let view = view else { return }

        view.endEditing(true)
        view.addSubview(self)
        self.dock(to: view, constant: 0)
    }
}
