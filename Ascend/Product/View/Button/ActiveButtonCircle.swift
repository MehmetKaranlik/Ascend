//
//  ActiveButtonCircle.swift
//  Ascend
//
//  Created by Mehmet  on 30.09.2023.
//

import Foundation
import UIKit

class ActiveButtonCircle : BaseButton {
    
    
    let callback : (() -> ())?
    
    init( callback : (() -> ())?) {
        self.callback = callback
        super.init()
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var backgrounColor: UIColor {
        .appActive
    }
    
    override var cornerRadius: CGFloat {
        self.frame.width / 2
    }
    
    override var image: UIImage? {
        .icNewDocument
    }
    
    override var config: UIButton.Configuration {
        var config : UIButton.Configuration = .borderless()
        config.contentInsets = (Paddings.vertical.medium + Paddings.horizontal.medium).toNs()
        return config
    }
    
    override var onTap: UIAction? {
        UIAction { [weak self] _ in
            guard self?.callback != nil else { return }
            self?.callback!()
        }
    }
}


@available(iOS 17.0, *)
#Preview(traits: .defaultLayout, body: {
    ActiveButtonCircle {
        
    }
})
