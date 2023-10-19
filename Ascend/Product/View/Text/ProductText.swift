//
//  ProductText.swift
//  Ascend
//
//  Created by Mehmet  on 25.09.2023.
//

import Foundation
import UIKit

class ProductText : UILabel {
    
    private let value : String
    private let textFont : UIFont?
    private let foregroundColor : UIColor

    
    init(value: String?, textFont: FontStyle = .body, foregroundColor: UIColor = .label) {
        self.value = value ?? ""
        self.textFont = textFont.toFont()
        self.foregroundColor = foregroundColor
        super.init(frame: .zero)
        super.text = value
        super.textColor = foregroundColor
        super.numberOfLines = 0
        super.font = self.textFont
    }
    

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setText(_ text: String ) {
        self.text = text
    }
}



@available(iOS 17.0, *)
#Preview(traits: .defaultLayout) {
    ProductText(value: StringKeys.Buttons.getStarted.rawValue,textFont:.extraLargeTitle)
}


