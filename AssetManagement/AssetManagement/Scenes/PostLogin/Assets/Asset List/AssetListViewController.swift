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

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if SessionManager.shared.assetListNeedsRefresh,
            viewModel.stateChangeHandler != nil  {

            SessionManager.shared.employeeListNeedsRefresh = false
            viewModel.fetchAssets()
        }
    }

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

        ButtonCustomizer.applyBackgroundColor(to: addAssetButton,
                                              color: .lightBlue)
    }

    func applyLocalization() {
        addAssetButton.setTitle("Add New Asset", for: .normal)
    }
}

// MARK: - Actions
extension AssetListViewController {

    @IBAction func addAssetButton(_ sender: Any) {
        let addAssetViewController = AddAssetViewController.loadFromStoryboard()
        addAssetViewController.viewModel = AddAssetViewModel(dataController: AddAssetDataController())
        navigationController?.pushViewController(addAssetViewController, animated: true)
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
