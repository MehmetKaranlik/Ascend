//
//  CheckBoxRowView.swift
//  Ascend
//
//  Created by Mehmet  on 2.10.2023.
//

import Foundation
import UIKit
import STTextView
class CheckBoxRowView : UIView {
    
    
    private var isChecked : Bool = false
    private lazy var checkbox = IconButton(icon: .icCheckboxEmpty,onTap: toggleState)
    private let textView = STTextView()
    private lazy var stack = UIStackView(arrangedSubviews: [checkbox,textView])
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpTextView()
        setUpStack()
    }
    
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpTextView()
        setUpStack()
    }
    
    private func toggleState() {
        isChecked = !isChecked
        assignImage()
        updateAttributes()
        updateTextViewOnCheck()
    }
    
    private func assignImage() {
        if self.isChecked {
            checkbox.setImage(.icCheckboxFilled, for: .normal)
        }else {
            checkbox.setImage(.icCheckboxEmpty, for: .normal)
        }
    }
    
 
    
    private func setUpTextView() {
        textView.isScrollEnabled = false
        textView.backgroundColor = .clear
        textView.typingAttributes = attributes()
        textView.textColor = .white
        textView.returnKeyType = .done
    }
    
    
    private func setUpStack () {
        addSubview(stack)
        stack.alignment = .top
        stack.axis = .horizontal
        stack.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.width.equalToSuperview()
            make.center.equalToSuperview()
        }
    }
    
    private func attributes() -> [NSAttributedString.Key : Any] {
        var attributes : [NSAttributedString.Key : Any] =  [
            NSAttributedString.Key.foregroundColor : UIColor.label,
        ]
        if !isChecked { return attributes }
        if isChecked {
            attributes[NSAttributedString.Key.strikethroughStyle] = NSUnderlineStyle.single.rawValue
        }
        return attributes
    }
    
    private func updateAttributes(){
        textView.attributedText = NSAttributedString(string: textView.text, attributes: attributes())
    }
    
    
    private func updateTextViewOnCheck() {
        textView.isEditable = !isChecked
       
    }
    
    func focus() {
        self.textView.becomeFirstResponder()
    }
    
    func addKeyboardAccessory(accessory : KeyboardAccessory) {
        textView.inputAccessoryView = accessory
    }
}



@available(iOS 17.0, *)
#Preview(traits: .defaultLayout) {
    CheckBoxRowView()
}
