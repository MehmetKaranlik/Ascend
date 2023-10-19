//
//  CustomTextView.swift
//  Ascend
//
//  Created by Mehmet  on 2.10.2023.
//

import Foundation
import STTextView
import UIKit

class ProductTextView: STTextView {
    var textViewOnChanged: (() -> Void)?
    init(placeholder: String? = nil) {
        super.init(frame: .zero, textContainer: nil)
        super.isScrollEnabled = false
        super.backgroundColor = .clear
        super.placeholder = placeholder ?? ""
        super.textColor = .white
        NotificationCenter.default.addObserver(
            self, selector: #selector(onTextChange),
            name: UITextView.textDidChangeNotification, object: nil
        )
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        super.isScrollEnabled = false
        super.backgroundColor = .clear
        super.textColor = .white
        NotificationCenter.default.addObserver(
            self, selector: #selector(onTextChange),
            name: UITextView.textDidChangeNotification, object: nil
        )
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    func assignCallback(_ action: @escaping () -> Void) {
        textViewOnChanged = action
    }

    @objc private func onTextChange(_ sender: Any?) {
        textViewOnChanged?()
    }
}
