//
//  SplashView.swift
//  Ascend
//
//  Created by Mehmet  on 25.09.2023.
//

import Foundation
import UIKit
import SnapKit

class SplashView : BaseView {
    
    let appName = ProductText(value: StringKeys.General.appName.rawValue,textFont: .extraLargeTitle)
    let desc = ProductText(value: StringKeys.Splash.desc.rawValue,textFont: .title1)

    
    override func setUp() {
        addSubview(appName)
        addSubview(desc)
    }
    
    
    override func layout() {
        appName.snp.makeConstraints { make in
            make.center.equalTo(self)
        }
        
        desc.snp.makeConstraints { make in
            make.centerX.equalTo(self)
            make.top.equalTo(appName.snp.bottom).inset(-10)
        }
    }
    
    
    
}




@available(iOS 17.0, *)
#Preview(traits: .defaultLayout, body: {
    SplashView()
})
