//
//  KeyboardHandler.swift
//  Ascend
//
//  Created by Mehmet  on 6.10.2023.
//

import UIKit

 protocol KeyboardProtocol {
    func registerKeyboardActions()
    func keyboardWillShow(notification: NSNotification)
    func keyboardWillHide()
    func removeObserver()
}

extension KeyboardProtocol {
    
    
    func removeObserver() {
        NotificationCenter.default.removeObserver(self)
    }
}
