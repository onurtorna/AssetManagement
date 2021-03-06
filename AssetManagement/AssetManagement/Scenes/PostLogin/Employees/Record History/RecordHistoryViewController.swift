//
//  RecordHistoryViewController.swift
//  AssetManagement
//
//  Created by Onur Torna on 18.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import UIKit

final class RecordHistoryViewController: UIViewController {

    private enum Constant {
        static let cellReuseIdentifier = "RecordListTableViewCell"
    }

    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var emptyStateInfo: UILabel!

    var viewModel: RecordHistoryViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        applyStyling()
        applyLocalization()

        tableView.dataSource = self

        viewModel.stateChangeHandler = applyState(_:)
        viewModel.fetchAllRelatedRecords()
    }
}

// MARK: - Helpers
private extension RecordHistoryViewController {

    func applyState(_ change: RecordHistoryState.Change) {
        switch change {
        case .loading(let isLoading):
            showLoading(isLoading)

        case .error(message: let message):
            showToaster(type: .error, text: message)

        case .dataFetch(isListEmpty: let isEmpty):
            tableView.isHidden = isEmpty
            emptyStateInfo.isHidden = !isEmpty
            tableView.reloadData()

        }
    }

    func applyStyling() {
        LabelCustomizer.applyFont(label: emptyStateInfo,
                                  font: .bold,
                                  size: 16,
                                  color: .black)
    }

    func applyLocalization() {
        emptyStateInfo.text = "No Records found for the employee.."
        title = "History"
    }
}

// MARK: - UITableViewDataSource
extension RecordHistoryViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.recordCount
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constant.cellReuseIdentifier),
            let record = viewModel.record(at: indexPath.row)
            else {
                return UITableViewCell()
        }

        cell.textLabel?.text = "Asset ID: \(record.assetId)"
        cell.textLabel?.textColor = .white
        cell.detailTextLabel?.text = StringUtils.convertServiceTimeDateString(inputDate: record.date)
        cell.detailTextLabel?.textColor = .white
        cell.backgroundColor = record.isReceiveRecord ? .aquaGreen : .red
        return cell
    }
}

// MARK: - StoryboardLoadable
extension RecordHistoryViewController: StoryboardLoadable {

    static var defaultStoryboardName: String {
        return Global.Storyboard.employees
    }
}
