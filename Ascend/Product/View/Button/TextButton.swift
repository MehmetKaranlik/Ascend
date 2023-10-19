//
//  TextButton.swift
//  Ascend
//
//  Created by Mehmet  on 1.10.2023.
//

import Foundation
import UIKit

class TextButton<T : Localizable<T>> : BaseButton {
    
    let text : T
    let color : UIColor?
    
    init(text: T, foregroundColor : UIColor? = nil) {
        self.text = text
        self.color = foregroundColor
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override var backgrounColor: UIColor {
        .clear
    }
    
    override var foregroundColor: UIColor {
        self.color ?? super.foregroundColor
    }
    
    override var label: String? {
        text.rawValue
    }
    
 
    override var config: UIButton.Configuration {
        let config : UIButton.Configuration = .plain()
        return config
    }
}
