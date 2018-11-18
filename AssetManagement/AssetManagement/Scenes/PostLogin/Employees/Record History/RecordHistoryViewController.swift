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

    var viewModel: RecordHistoryViewModel!
}

// MARK: - StoryboardLoadable
extension RecordHistoryViewController: StoryboardLoadable {

    static var defaultStoryboardName: String {
        return Global.Storyboard.employees
    }
}
