//
//  AddAssetViewController.swift
//  AssetManagement
//
//  Created by Onur Torna on 18.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import UIKit

final class AddAssetViewController: UIViewController {

    private enum Constant {
        static let keyboardMargin: CGFloat = 20
    }

    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var nameTextField: UITextField!
    @IBOutlet private weak var notesTextField: UITextField!
    @IBOutlet private weak var serialNumberTextField: UITextField!
    @IBOutlet private weak var createAssetButton: UIButton!
    @IBOutlet private weak var infoLabel: UILabel!

    /// Last known scroll position
    private var lastContentInset = UIEdgeInsets.zero

    /// Current active textField
    private var activeTextField: UITextField?

    private var isKeyboardPresent = false

    var viewModel: AddAssetViewModel!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        applyStyling()
        applyLocalization()
        addToolbarToTextFields()
        registerForKeyboardNotifications()
        hideKeyboardWhenTappedOutside()
    }
}

// MARK: - Helpers
private extension AddAssetViewController {

    func applyStyling() {

        LabelCustomizer.applyFont(label: infoLabel, size: 14)
        ButtonCustomizer.applyRoundedStyling(to: createAssetButton,
                                             color: .lightBlue)
    }

    func applyLocalization() {

        title = "Add New Asset"
        createAssetButton.setTitle("Add Asset", for: .normal)
        infoLabel.text = "Please enter required information about the new asset."
        nameTextField.placeholder = "Asset Name"
        notesTextField.placeholder = "Notes"
        serialNumberTextField.placeholder = "Serial Number of the Asset"
    }

    func addToolbarToTextFields() {

        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace,
                                          target: nil,
                                          action: nil)
        let doneButton = UIBarButtonItem(title: "Ok",
                                         style: UIBarButtonItem.Style.done,
                                         target: self,
                                         action: #selector(closeKeyboard))
        toolbar.setItems([spaceButton, doneButton], animated: false)

        nameTextField.inputAccessoryView = toolbar
        serialNumberTextField.inputAccessoryView = toolbar
        notesTextField.inputAccessoryView = toolbar
    }

    func registerForKeyboardNotifications() {

        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow(notification:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide(notification:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
}

// MARK: - Keyboard
extension AddAssetViewController {

    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey]
            as? NSValue)?.cgRectValue,
            !isKeyboardPresent {

            let contentInsets = UIEdgeInsets(top: 0.0,
                                             left: 0.0,
                                             bottom: keyboardSize.height + Constant.keyboardMargin,
                                             right: 0.0)

            lastContentInset = scrollView.contentInset
            scrollView.contentInset = contentInsets
            scrollView.scrollIndicatorInsets = contentInsets

            if let activeTextField = activeTextField {
                DispatchQueue.main.async {
                    self.scrollView.scrollRectToVisible(activeTextField.frame,
                                                        animated: true)
                }
            }

            isKeyboardPresent = true
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        if (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey]
            as? NSValue)?.cgRectValue != nil {

            let contentInset = lastContentInset
            scrollView.contentInset = contentInset
            scrollView.scrollIndicatorInsets = contentInset
            isKeyboardPresent = false
        }
    }
}

// MARK: - Actions
private extension AddAssetViewController {

    @objc func closeKeyboard() {
        view.endEditing(true)
    }

    @IBAction func addAssetButtonTapped(_ sender: Any) {
        // TODO: To be implemented
    }

    @IBAction func textFieldEditingDidBegin(_ sender: UITextField) {
        activeTextField = sender
    }

    @IBAction func textFieldEditingDidEnd(_ sender: UITextField) {
        activeTextField = nil
    }
}

// MARK: - StoryboardLoadable
extension AddAssetViewController: StoryboardLoadable {

    static var defaultStoryboardName: String {
        return Global.Storyboard.assets
    }
}
