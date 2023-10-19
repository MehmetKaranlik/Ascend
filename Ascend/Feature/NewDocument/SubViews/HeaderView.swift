//
//  HeaderView.swift
//  Ascend
//
//  Created by Mehmet  on 2.10.2023.
//

import Foundation
import UIKit

class NewDocumentHeaderView: UIView {
    
    private let titleTf = ProductTextField(
        initialValue: StringKeys.NewDocuments.inputTitle,
        textFont: .largeTitle,
        foregroundColor: .white
    )
    
    private let label = ProductText(
        value: DateHelpers.currentDate(),
        textFont: .caption1,
        foregroundColor: .systemGray
    )
    
    lazy var stack = UIStackView(arrangedSubviews: [titleTf,label])
    
    init() {
        super.init(frame: .zero)
        setupStack()
        layoutStack()
      
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
    func setupStack() {
        addSubview(stack)
        stack.axis = .vertical
        stack.spacing = Spacings.low.rawValue
        titleTf.becomeFirstResponder()
    }
    
    func layoutStack() {
        stack.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    
  
}
