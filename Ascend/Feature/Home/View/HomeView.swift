//
//  HomeView.swift
//  Ascend
//
//  Created by Mehmet  on 30.09.2023.
//

import Foundation
import UIKit

protocol HomeViewDelegate : AnyObject {
    func didTapNewDocumentButton()
}

class HomeView : BaseView {
    
    weak var delegate : HomeViewDelegate?
    
    private lazy var newDocButton = ActiveButtonCircle(callback: onTap)
    
    override func setUp() {
        addSubview(newDocButton)
        
    }
    
    override func layout() {
        newDocButton.snp.makeConstraints { make in
            make.bottom.equalTo(self.snp.bottomMargin)
            make.right.equalTo(self.snp.rightMargin).inset(Spacings.normal.rawValue)
        }
    }
    
    private func onTap() {
        delegate?.didTapNewDocumentButton()
    }
    
}



@available(iOS 17.0, *)
#Preview( traits: .defaultLayout,body: {
    HomeView()
})
