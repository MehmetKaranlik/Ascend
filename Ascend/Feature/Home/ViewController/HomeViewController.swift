//
//  HomeViewController.swift
//  Ascend
//
//  Created by Mehmet  on 30.09.2023.
//

import Foundation
import UIKit

class HomeViewController : BaseViewController , HomeViewDelegate {

    
    
    let icMore = IconButton(icon: .icMore)
    let icSearch = IconButton(icon: .icSearch)
    let appName = ProductText(value: StringKeys.General.appName.rawValue,textFont: .title2,foregroundColor: .white)
    lazy var leftIcons = [icMore,icSearch].map { UIBarButtonItem(customView: $0) }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: appName)
        navigationItem.rightBarButtonItems = leftIcons
    }
    
    override var page: BaseView {
        let view = HomeView()
        view.delegate = self
        return view
    }
    
    func didTapNewDocumentButton() {
        let vc = NewDocumentViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}



@available(iOS 17.0, *)
#Preview(traits: .defaultLayout,body: {
    UINavigationController(rootViewController:  HomeViewController())
})
