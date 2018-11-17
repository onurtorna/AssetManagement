//
//  AssetListViewController.swift
//  AssetManagement
//
//  Created by Onur Torna on 17.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import UIKit

final class AssetListViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var addAssetButton: UIButton!

    var viewModel: AssetListViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.stateChangeHandler = applyState(_:)
    }
}

// MARK: - Helpers
private extension AssetListViewController {

    func applyState(_ change: AssetListState.Change) {
        switch change {
        case .loading(let isLoading):
            showLoading(isLoading)

        case .error(message: let message):
            showToaster(type: .error, text: message)

        case .dataFetch:
            tableView.reloadData()
        }
    }
}

// MARK: - StoryboardLoadable
extension AssetListViewController: StoryboardLoadable {
    static var defaultStoryboardName: String {
        return Global.Storyboard.assets
    }
}
