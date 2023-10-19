//
//  ActiveButton.swift
//  Ascend
//
//  Created by Mehmet  on 29.09.2023.
//

import Foundation
import UIKit

class ActiveButtonCapsule<T : Localizable<T>> : BaseButton {
    
    let text : T
    let onPressed : (() -> Void)?
    
    init(text:  T, onPressed : (() -> Void)?) {
        self.text = text
        self.onPressed = onPressed
        super.init()
    }
     
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var backgrounColor: UIColor {
        .appActive
    }
    
    override var label: String? {
        return text.rawValue
    }
    
    override var cornerRadius: CGFloat {
        self.frame.height / 2
    }
    
    override var onTap: UIAction? {
        UIAction { [weak self]  _ in
            guard  self?.onPressed != nil else { return }
            self!.onPressed!()
        }
    }
}



@available(iOS 17.0, *)
#Preview(traits: .defaultLayout, body: {
    ActiveButtonCapsule(text:StringKeys.Buttons.getStarted) {
      
    }
})
