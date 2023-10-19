//
//  UIResponder+Extensions.swift
//  Ascend
//
//  Created by Mehmet  on 4.10.2023.
//

import Foundation
import UIKit

extension UIResponder {
    private weak static var _firstResponder: UIResponder?
    
    static var firstResponder: UIResponder? {
        _firstResponder = nil
        // Tell the first responder to record itself in `_firstResponder`
        UIApplication.shared.sendAction(#selector(_recordFirstResponder), to: nil, from: nil, for: nil)
        return _firstResponder
    }
    
    @objc private func _recordFirstResponder() {
        UIResponder._firstResponder = self
    }
}
