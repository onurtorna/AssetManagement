//
//  EmployeeListViewController.swift
//  AssetManagement
//
//  Created by Onur Torna on 17.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import UIKit

final class EmployeeListViewController: UIViewController {

}

// MARK: - StoryboardLoadable
extension EmployeeListViewController: StoryboardLoadable {

    static var defaultStoryboardName: String {
        return Global.Storyboard.employees
    }
}
