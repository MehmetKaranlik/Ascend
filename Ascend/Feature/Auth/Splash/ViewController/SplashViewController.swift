//
//  SplashViewController.swift
//  Ascend
//
//  Created by Mehmet  on 25.09.2023.
//

import Foundation
import UIKit

class SplashViewController : BaseViewController {
    override func viewDidLoad() {
        DispatchQueue.main.asyncAfter(deadline: Durations.high.time()) { [weak self] in
            self?.view.window?.replaceRoot(OnboardingViewController())
        }

    }
    override var page: BaseView {
        return SplashView()
    }
}


@available(iOS 17.0, *)
#Preview(traits: .defaultLayout, body: {
     SplashViewController()
})
