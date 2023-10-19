//
//  BaseButton.swift
//  Ascend
//
//  Created by Mehmet  on 29.09.2023.
//

import Foundation
import UIKit

class BaseButton : UIButton {
    
    init() {
        super.init(frame: .zero)
        super.backgroundColor = self.backgrounColor
        super.setTitleColor(disabledColor, for: .disabled)
        super.setTitleColor(foregroundColor, for: .normal)
        super.configuration = config
        setChild()
        super.isEnabled = onTap != nil
        if let action = onTap {
            super.addAction(action, for: .touchUpInside)
        }
    }
    
    
    
    var config : UIButton.Configuration {
        var config : UIButton.Configuration = .borderless()
        config.contentInsets = (Paddings.horizontal.normal + Paddings.vertical.standart).toNs()
        return config
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var backgrounColor : UIColor {
        .systemBlue
    }
    
    
    var foregroundColor : UIColor {
        .label
    }
    
    var label : String? {
        "Base"
    }
    
    var disabledColor : UIColor {
        .secondaryLabel
    }
    
    var image :UIImage? {
        nil
    }
    
    var selectedImage : UIImage? {
        nil
    }
    
    var onTap : UIAction? {
        return nil
    }
    
    
    var cornerRadius : CGFloat {
        .zero
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = cornerRadius
    }
    
    
    
    private func setChild() {
        if image != nil || selectedImage != nil {
            if let icon = image {
                super.setImage(icon, for: .normal)
                
            }
            
            if let selectedIcon = selectedImage {
                super.setImage(selectedIcon, for: .selected)
            }
            return
        }
        
        
        super.setTitle(label, for: .normal)
    }
}


@available(iOS 17.0, *)
#Preview(traits: .defaultLayout, body: {
    BaseButton()
})
