//
//  BaseViewController.swift
//  Ascend
//
//  Created by Mehmet  on 25.09.2023.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    override func viewDidLoad() {
        view = page
        cfgNavBar()
    }
    

    
    var page: BaseView {
        let view = BaseView(navigationController: self.navigationController)
        return view
    }
    
    private let navBarAppereance: UINavigationBarAppearance = {
        let appper = UINavigationBarAppearance()
        appper.backgroundColor = .appBackground
        return appper
    }()

    var leftNavBarItems: [UIView]? {
        return nil
    }
    
    var rightNavBarItems: [UIView]? {
        return nil
    }
    
    private func cfgNavBar() {
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.backgroundColor = .appBackground
        navigationController?.navigationBar.standardAppearance = navBarAppereance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppereance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppereance
        let leftItems = leftNavBarItems?.compactMap { UIBarButtonItem(customView: $0) }
        let rightItems = rightNavBarItems?.compactMap { UIBarButtonItem(customView: $0) }
        navigationItem.leftBarButtonItems = leftItems
        navigationItem.rightBarButtonItems = rightItems
    }
}
