//
//  AddNewEmployeeViewController.swift
//  AssetManagement
//
//  Created by Onur Torna on 18.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import UIKit

final class AddNewEmployeeViewController: UIViewController {

    @IBOutlet private weak var infoLabel: UILabel!
    @IBOutlet private weak var addEmployeeButton: UIButton!
    @IBOutlet private weak var employeeNameTextField: UITextField!

    var viewModel: AddNewEmployeeViewModel!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navigationController?.setNavigationBarHidden(false,
                                                     animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        applyStyling()
        applyLocalization()

        viewModel.stateChangeHandler = applyState(_:)
    }
}

// MARK: - Helpers
private extension AddNewEmployeeViewController {

    func applyState(_ change: AddNewEmployeeState.Change) {

        switch change {
        case .loading(let isLoading):
            showLoading(isLoading)

        case .error(message: let message):
            showToaster(type: .error, text: message)

        case .success:
            showToaster(type: .success, text: "Adding Successfull!")
            navigationController?.popViewController(animated: true)
        }
    }

    func applyStyling() {
        LabelCustomizer.applyFont(label: infoLabel, size: 14)
        ButtonCustomizer.applyRoundedStyling(to: addEmployeeButton,
                                             color: .lightBlue)
    }

    func applyLocalization() {
        title = "Add New Employee"
        addEmployeeButton.setTitle("Add Employee",
                                   for: .normal)
        infoLabel.text = "Please enter full name of the new employee"
        employeeNameTextField.placeholder = "Name Surname"
    }
}

// MARK: - Actions
private extension AddNewEmployeeViewController {

    @IBAction func employeeNameTextFieldEditingChanged(_ sender: UITextField) {
        viewModel.updateEmployeeName(sender.text)
    }

    @IBAction func addNewEmployeeButtonTapped(_ sender: Any) {
        viewModel.createNewEmployee()
    }
}

// MARK: - StoryboardLoadable
extension AddNewEmployeeViewController: StoryboardLoadable {

    static var defaultStoryboardName: String {
        return Global.Storyboard.employees
    }
}
