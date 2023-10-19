//
//  UIApplication+Extension.swift
//  Ascend
//
//  Created by Mehmet  on 4.10.2023.
//

import Foundation
import UIKit

extension UIApplication {
    static var safeAreaInsets : UIEdgeInsets {
        guard
            let firstScene = shared.connectedScenes.first as? UIWindowScene,
            let firstWindow = firstScene.windows.first
        else {
            return .zero
        }
        return firstWindow.safeAreaInsets
    }
    
    
    static var currentVC : UIViewController? {
        guard
            let firstScene = shared.connectedScenes.first as? UIWindowScene,
            let firstWindow = firstScene.windows.first
        else {
            return nil
        }
        return firstWindow.rootViewController
    }
}
