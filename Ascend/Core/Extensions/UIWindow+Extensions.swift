//
//  UIWindow+Extensions.swift
//  Ascend
//
//  Created by Mehmet  on 25.09.2023.
//

import Foundation
import UIKit

extension UIWindow {
    func replaceRoot(_ to : UIViewController) {
        self.rootViewController = to
        let options: UIView.AnimationOptions = .transitionCrossDissolve
        let duration: TimeInterval = 0.3
        UIView.transition(
            with: self,
            duration: duration,
            options: options,
            animations: nil,
            completion: nil
            )
    }
}
