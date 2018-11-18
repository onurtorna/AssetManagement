//
//  EmployeeDetailViewController.swift
//  AssetManagement
//
//  Created by Onur Torna on 17.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import UIKit

final class EmployeeDetailViewController: UIViewController {

    @IBOutlet private weak var infoLabel: UILabel!
    @IBOutlet private weak var showAssetHistoryButton: UIButton!
    @IBOutlet private weak var addAssetButton: UIButton!

    var viewModel: EmployeeDetailViewModel!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        applyStyling()
        applyLocalization()

        viewModel.stateChangeHandler = applyState(_:)
    }
}

// MARK: - Helpers
private extension EmployeeDetailViewController {

    func applyState(_ change: EmployeeDetailState.Change) {
        switch change {
        case .loading(let isLoading):
            showLoading(isLoading)

        case .error(message: let message):
            showToaster(type: .error, text: message)

        case .initialPublish(name: let name):
            infoLabel.text = "Please select action for " + name
        }
    }

    func applyStyling() {

        ButtonCustomizer.applyEmptyRoundedStyling(to: addAssetButton,
                                                  color: .lightBlue)
        ButtonCustomizer.applyEmptyRoundedStyling(to: showAssetHistoryButton,
                                                  color: .lightBlue)
    }

    func applyLocalization() {
        title = "Employee Actions"
        showAssetHistoryButton.setTitle("Show Asset History", for: .normal)
        addAssetButton.setTitle("Add New Asset to Employee", for: .normal)
    }
}

// MARK: - Actions
private extension EmployeeDetailViewController {

    @IBAction func showAssetHistoryButtonTapped(_ sender: Any) {

        let recordHistoryViewController = RecordHistoryViewController.loadFromStoryboard()
        recordHistoryViewController.viewModel = RecordHistoryViewModel(employee: viewModel.employee,
                                                                       dataController: RecordHistoryDataController())
        navigationController?.pushViewController(recordHistoryViewController,
                                                 animated: true)
    }

    @IBAction func addAssetButtonTapped(_ sender: Any) {
        let assignAssetToEmployeeViewController = AssignAssetToEmployeeViewController.loadFromStoryboard()
        assignAssetToEmployeeViewController.viewModel = AssignAssetToEmployeeViewModel(employee: viewModel.employee,
                                                                                       dataController: AssignAssetToEmployeeDataController())
        navigationController?.pushViewController(assignAssetToEmployeeViewController,
                                                 animated: true)
    }
}

// MARK: - StoryboardLoadable
extension EmployeeDetailViewController: StoryboardLoadable {

    static var defaultStoryboardName: String {
        return Global.Storyboard.employees
    }
}
