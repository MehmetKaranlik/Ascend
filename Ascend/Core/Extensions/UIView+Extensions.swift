//
//  UIView+Extensions.swift
//  Ascend
//
//  Created by Mehmet  on 4.10.2023.
//

import UIKit

extension UIView {
    var firstResponder: UIView? {
        guard !isFirstResponder else { return self }

        for subview in subviews {
            if let firstResponder = subview.firstResponder {
                return firstResponder
            }
        }

        return nil
    }
}
