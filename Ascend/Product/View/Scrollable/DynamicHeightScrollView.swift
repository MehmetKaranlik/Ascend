//
//  DynamicHeightScrollView.swift
//  Ascend
//
//  Created by Mehmet  on 4.10.2023.
//

import SnapKit
import UIKit

open class DynamicHeightScrollView: UIScrollView {
    private let subViews: [UIView]?
    private let stack = UIStackView()
    private var bottomConstraint: ConstraintMakerEditable?
  
    init(subViews: [UIView], padding: UIEdgeInsets = .zero) {
        self.subViews = subViews
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        configureContentView(padding)
      
    }
  
    @available(*, unavailable)
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
  
    func configureContentView(_ inset: UIEdgeInsets) {
        guard let subViews = subViews else { return }
        layoutStack(subViews: subViews)
    }
    
    private func layoutStack(subViews: [UIView]) {
        addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = Spacings.standart.rawValue
        stack.sizeToFit()
        for (index, view) in subViews.enumerated() {
            view.tag = index
            stack.addArrangedSubview(view)
        }
        stack.snp.makeConstraints { make in
            make.top.equalTo(contentLayoutGuide)
            make.leading.equalTo(contentLayoutGuide)
            make.width.equalTo(self)
            bottomConstraint = make.bottom.equalTo(contentLayoutGuide)
        }
    }
    
    @objc private func handleKeyboardOpen(notification: NSNotification) {
        guard
            let view = stack.arrangedSubviews.first(where: { $0.firstResponder != nil }) as? CheckBoxRowView,
            let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
        else { return }
        let globalOffset = self.frame.minY
        let statusBarHeight = UIApplication.shared.statusBarFrame.size.height
        let topInset = UIApplication.safeAreaInsets.top
        let viewOffset = globalOffset  + topInset + statusBarHeight
        let viewGlobalMaxy = view.frame.maxY + globalOffset
        
        print("View MAXY : \(view.bounds.maxY + viewOffset), MİNY : \(view.frame.minY)")
        print("KEYBOARD  MİNY : \(keyboardSize.minY), MAXY : \(keyboardSize.maxY)")
        
        if view.frame.maxY + viewOffset  >= keyboardSize.minY  {
            bottomConstraint?.constraint.update(offset: -keyboardSize.height  )
            setContentOffset(.init(x: 0, y: viewGlobalMaxy - keyboardSize.height), animated: true)
        }
        
        
    }
    
    @objc private func handleKeyboardClose() {
        bottomConstraint?.constraint.update(offset: 0)
    }
}
