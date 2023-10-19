//
//  ProductTextField.swift
//  Ascend
//
//  Created by Mehmet  on 1.10.2023.
//

import Foundation
import UIKit

class ProductTextField<T: Localizable<T>> : UITextField {
    
    let initialValue : T?
    
    init(initialValue: T?, textFont: UIFont.TextStyle = .body, foregroundColor: UIColor = .label) {
        self.initialValue = initialValue
        super.init(frame: .zero)
        text = initialValue?.rawValue
        textColor = .white
        super.font = .preferredFont(forTextStyle: textFont)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
}
