//
//  IconButton.swift
//  Ascend
//
//  Created by Mehmet  on 30.09.2023.
//

import Foundation
import UIKit

class IconButton : BaseButton {
    
    let icon : UIImage
    let selectedIcon : UIImage?
    let callBack : (() -> Void)?
    let color : UIColor?
    init(icon: UIImage, selectedIcon : UIImage? = nil, onTap: (() ->Void)? = nil) {
        self.icon = icon
        self.callBack = onTap
        color = nil
        self.selectedIcon = selectedIcon
        super.init()
    }
    
    
    convenience init(icon: UIImage, onTap: (() ->Void)? = nil, foregrounColor : UIColor) {
        self.init(icon: icon.withTintColor(foregrounColor, renderingMode: .alwaysOriginal), onTap: onTap)
    }
    
    
    
    override var config: UIButton.Configuration {
        let config : UIButton.Configuration = .plain()
        return config
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override var image: UIImage? {
        icon
    }
    
    override var backgrounColor: UIColor {
        .clear
    }
    
    override var onTap: UIAction? {
        UIAction { [weak self] _ in
            guard self?.callBack != nil else { return }
            self!.callBack!()
        }
    }
    
}



@available(iOS 17.0, *)
#Preview(traits: .defaultLayout, body: {
    IconButton(icon: .icCheckboxFilled)
})


