//
//  KeyboardSensitiveTableView.swift
//  Ascend
//
//  Created by Mehmet  on 6.10.2023.
//

import UIKit

class KeyboardSensitiveTableView: UITableView, KeyboardProtocol {
    init() {
        super.init(frame: .zero, style: .plain)
        registerKeyboardActions()
    }
    
    deinit {
        removeObserver()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        guard let userInfo = notification.userInfo,
              let keyboardMap = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue
        else { return }
        let keyboardRect = keyboardMap.cgRectValue
        self.contentInset.bottom = keyboardRect.height
    }
    
    @objc func keyboardWillHide() {
        contentInset = .zero
    }
    
    func registerKeyboardActions() {
       NotificationCenter.default.addObserver(
           self, selector: #selector(keyboardWillShow),
           name: UIResponder.keyboardWillShowNotification, object: nil
       )
      
       NotificationCenter.default.addObserver(
           self, selector: #selector(keyboardWillHide),
           name: UIResponder.keyboardWillHideNotification, object: nil
       )
    }
}
