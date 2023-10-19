//
//  OnboardingViewController.swift
//  Ascend
//
//  Created by Mehmet  on 25.09.2023.
//

import Foundation
import UIKit

class OnboardingViewController : BaseViewController, OnboardingDelegate {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
       
    }
    
    override var page: BaseView {
        OnboardingView(delegate: self)
    }
    
    func onGetStartedTapped() {
        let vc = UINavigationController(rootViewController: HomeViewController())
        self.view.window?.replaceRoot(vc)
    }
    
    
}



@available(iOS 17.0, *)
#Preview(traits: .defaultLayout,body: {
    OnboardingViewController()
})
