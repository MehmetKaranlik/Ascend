//
//  BaseCell.swift
//  Ascend
//
//  Created by Mehmet  on 5.10.2023.
//

import UIKit


protocol BaseEditableCell<T> where Self : UITableViewCell {
    associatedtype T = UITableViewCell
    
    func configure(_ keyboardAccessory : KeyboardAccessory)
    func onEdit()
}
