//
//  AssetListViewController.swift
//  AssetManagement
//
//  Created by Onur Torna on 17.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import UIKit

final class AssetListViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var addAssetButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - StoryboardLoadable
extension AssetListViewController: StoryboardLoadable {
    static var defaultStoryboardName: String {
        return Global.Storyboard.assets
    }
}
