//
//  EmployeeListViewController.swift
//  AssetManagement
//
//  Created by Onur Torna on 17.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import UIKit

final class EmployeeListViewController: UIViewController {

    private enum Constant {
        static let cellReuseIdentifier = "EmployeeListTableViewCell"
    }

    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var addEmployeeButton: UIButton!
    @IBOutlet private weak var buttonStackView: UIStackView!
    
    var viewModel: EmployeeListViewModel!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true,
                                                     animated: true)

        if let indexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: indexPath, animated: true)
        }

        if SessionManager.shared.employeeListNeedsRefresh,
            viewModel.stateChangeHandler != nil  {

            SessionManager.shared.employeeListNeedsRefresh = false
            viewModel.fetchEmployees()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        applyStyling()
        applyLocalization()

        tableView.dataSource = self
        tableView.delegate = self

        viewModel.stateChangeHandler = applyState(_:)
        viewModel.fetchEmployees()
    }
}

// MARK: - Helpers
extension EmployeeListViewController {

    func applyState(_ change: EmployeeListState.Change) {

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

        ButtonCustomizer.applyBackgroundColor(to: addEmployeeButton,
                                              color: .lightBlue)
    }

    func applyLocalization() {
        addEmployeeButton.setTitle("Add New Employee", for: .normal)
    }
}

// MARK: - Actions
private extension EmployeeListViewController {

    @IBAction func addEmployeeButtonTapped(_ sender: Any) {
        let addNewEmployeeViewController = AddNewEmployeeViewController.loadFromStoryboard()
        addNewEmployeeViewController.viewModel = AddNewEmployeeViewModel(dataController: AddNewEmployeeDataController())
        navigationController?.pushViewController(addNewEmployeeViewController,
                                                 animated: true)
    }
}

// MARK: - UITableViewDelegate
extension EmployeeListViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {

        guard let employee = viewModel.employee(at: indexPath.row) else { return }

        let employeeDetailViewController = EmployeeDetailViewController.loadFromStoryboard()
        employeeDetailViewController.viewModel = EmployeeDetailViewModel(employee: employee)
        navigationController?.pushViewController(employeeDetailViewController,
                                                 animated: true)
    }
}

// MARK: - UITableViewDataSource
extension EmployeeListViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return viewModel.employeeCount
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constant.cellReuseIdentifier),
            let employee = viewModel.employee(at: indexPath.row)
            else {
                return UITableViewCell()
        }

        cell.textLabel?.text = employee.name
        return cell
    }
}

// MARK: - StoryboardLoadable
extension EmployeeListViewController: StoryboardLoadable {

    static var defaultStoryboardName: String {
        return Global.Storyboard.employees
    }
}
