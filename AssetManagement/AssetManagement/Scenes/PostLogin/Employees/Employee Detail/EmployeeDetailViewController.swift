//
//  EmployeeDetailViewController.swift
//  AssetManagement
//
//  Created by Onur Torna on 17.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import UIKit

final class EmployeeDetailViewController: UIViewController {

    var viewModel: EmployeeDetailViewModel!
}

// MARK: - StoryboardLoadable
extension EmployeeDetailViewController: StoryboardLoadable {

    static var defaultStoryboardName: String {
        return Global.Storyboard.employees
    }
}
