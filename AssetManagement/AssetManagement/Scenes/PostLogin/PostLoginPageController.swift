//
//  PostLoginPageController.swift
//  AssetManagement
//
//  Created by Onur Torna on 17.11.2018.
//  Copyright © 2018 Onur Torna. All rights reserved.
//

import UIKit
import Tabman
import Pageboy

final class PostLoginPageViewController: TabmanViewController {

    private enum Constant {
        static let numberOfScreens = 2
    }

    private var viewControllers: [UIViewController]!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        prepareViewControllers()

        dataSource = self
        bar.style = .buttonBar
        bar.location = .top
        bar.items = [Item(title: "Employees"), Item(title: "Assets")]
    }
}

// MARK: - Helpers
private extension PostLoginPageViewController {

    func prepareViewControllers() {

        let employeeListViewController = EmployeeListViewController.loadFromStoryboard()
        employeeListViewController.viewModel = EmployeeListViewModel(dataController: EmployeeListDataController())

        let assetListViewController = AssetListViewController.loadFromStoryboard()
        viewControllers = [employeeListViewController, assetListViewController]
    }
}

// MARK: - PageboyViewControllerDataSource
extension PostLoginPageViewController: PageboyViewControllerDataSource {

    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return Constant.numberOfScreens
    }

    func viewController(for pageboyViewController: PageboyViewController,
                        at index: PageboyViewController.PageIndex) -> UIViewController? {
        return viewControllers[index]
    }

    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
    }
}

// MARK: - StoryboardLoadable
extension PostLoginPageViewController: StoryboardLoadable {

    static var defaultStoryboardName: String {
        return Global.Storyboard.postLogin
    }
}
