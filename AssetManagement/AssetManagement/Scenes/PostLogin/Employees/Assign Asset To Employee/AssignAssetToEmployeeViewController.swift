//
//  AssignAssetToEmployeeViewController.swift
//  AssetManagement
//
//  Created by Onur Torna on 18.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import UIKit

final class AssignAssetToEmployeeViewController: UIViewController {

    private enum Constant {
        static let cellReuseIdentifier = "AssetListTableViewCell"
    }

    @IBOutlet private weak var tableView: UITableView!

    var viewModel: AssignAssetToEmployeeViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self

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

// MARK: - UITableViewDataSource
extension AssignAssetToEmployeeViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return viewModel.assetCount
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {

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

// MARK: - UITableViewDelegate
extension AssignAssetToEmployeeViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {

        guard let asset = viewModel.asset(at: indexPath.row) else { return }

        let alertController = UIAlertController(title: "Asset Assigning",
                                                message: "Are you sure you want to assign " + asset.name + " with serial number " + asset.serialNumber + " to the employee?",
                                                preferredStyle: .alert)

        let okAction = UIAlertAction(title: "Ok", style: .default) { (_) in
            self.viewModel.assignAssetToEmployee(asset: asset)
        }

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in

            if let indexPath = tableView.indexPathForSelectedRow {
                tableView.deselectRow(at: indexPath, animated: true)
            }
        }

        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
}

// MARK: - StoryboardLoadable
extension AssignAssetToEmployeeViewController: StoryboardLoadable {

    static var defaultStoryboardName: String {
        return Global.Storyboard.assets
    }
}
