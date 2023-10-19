//
//  BaseView.swift
//  Ascend
//
//  Created by Mehmet  on 25.09.2023.
//

import Foundation
import UIKit

class BaseView: UIView {
    
    init(navigationController : UINavigationController? = nil) {
        super.init(frame: .zero)
        self.navigationController = navigationController
        self.setUp()
        self.layout()
        self.backgroundColor = .appBackground
    }
    
 
    
    var navigationController : UINavigationController?
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
    func setUp() {}
    
    func layout() {}
    

}
