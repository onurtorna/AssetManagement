//
//  AssignAssetToEmployeeViewController.swift
//  AssetManagement
//
//  Created by Onur Torna on 18.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import UIKit

final class AssignAssetToEmployeeViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!

    var viewModel: AssignAssetToEmployeeViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.stateChangeHandler = applyState(_:)
        viewModel.fetchAssets()
    }
}

// MARK: - Helpers
private extension AssignAssetToEmployeeViewController {

    func applyState(_ change: AssignAssetToEmployeeState.Change) {

        switch change {
        case .loading(let isLoading):
            showLoading(isLoading)

        case .error(message: let message):
            showToaster(type: .error, text: message)

        case .initialPublish(let firstname):
            title = "Assing Asset to " + firstname

        case .assetsFetch:
            tableView.reloadData()

        case .success:
            showToaster(type: .success, text: "Assign Successful!")
            navigationController?.popViewController(animated: true)
        }
    }
}

// MARK: - StoryboardLoadable
extension AssignAssetToEmployeeViewController: StoryboardLoadable {

    static var defaultStoryboardName: String {
        return Global.Storyboard.assets
    }
}
