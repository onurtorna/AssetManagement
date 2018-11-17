//
//  AssetListViewController.swift
//  AssetManagement
//
//  Created by Onur Torna on 17.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import UIKit

final class AssetListViewController: UIViewController {

    private enum Constant {
        static let cellReuseIdentifier = "AssetListTableViewCell"
    }

    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var addAssetButton: UIButton!
    @IBOutlet private weak var buttonStackView: UIStackView!

    var viewModel: AssetListViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        applyStyling()
        applyLocalization()

        tableView.dataSource = self

        viewModel.stateChangeHandler = applyState(_:)
        viewModel.fetchAssets()
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

    func applyStyling() {

        buttonStackView.addSeparatorAtTop(leftMargin: 0,
                                          rightMargin: 0,
                                          color: .black)
    }

    func applyLocalization() {
        addAssetButton.setTitle("Add New Asset", for: .normal)
    }
}

// MARK: - UITableViewDataSource
extension AssetListViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return viewModel.assetCount
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constant.cellReuseIdentifier),
            let asset = viewModel.asset(at: indexPath.row)
            else {
                return UITableViewCell()
        }

        cell.textLabel?.text = asset.name
        cell.detailTextLabel?.text = asset.serialNumber

        return cell
    }
}

// MARK: - StoryboardLoadable
extension AssetListViewController: StoryboardLoadable {
    static var defaultStoryboardName: String {
        return Global.Storyboard.assets
    }
}
