//
//  NewDocumentViewController.swift
//  Ascend
//
//  Created by Mehmet  on 1.10.2023.
//

import Foundation
import UIKit

class NewDocumentViewController: BaseViewController {
    private let backScreenText = ProductText(value: StringKeys.General.appName.rawValue, foregroundColor: .white)
    private let shareButton = IconButton(icon: .icShare)
    private let doneButton = TextButton(text: StringKeys.Buttons.done, foregroundColor: .white)
    private lazy var backButton: IconButton = {
        let icon = SystemImages.chevronLeft.uiImage().withTintColor(.white, renderingMode: .alwaysOriginal)
        return IconButton(icon: icon, onTap: self.onBackButtonPressed)
    }()
     
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override var page: BaseView {
        return NewDocumentView(navigationController: self.navigationController)
    }
    
    private func onBackButtonPressed() {
        navigationController?.popViewController(animated: true)
    }
    
    override var rightNavBarItems: [UIView]? {
        [self.doneButton, self.shareButton]
    }
    
    override var leftNavBarItems: [UIView]? {
        [self.backButton, self.backScreenText]
    }
}

@available(iOS 17.0, *)
#Preview(traits: .defaultLayout, body: {
    UINavigationController(rootViewController: NewDocumentViewController())
})
