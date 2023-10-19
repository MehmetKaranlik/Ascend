//
//  UINib+Extensions.swift
//  Ascend
//
//  Created by Mehmet  on 1.10.2023.
//

import Foundation
import UIKit


enum Nibs : String {
    case keyboardAccessory = "KeyboardAccessory"
    case descriptionCell = "DescriptionCell"
    case checkBoxRowCell = "CheckBoxRowCell"
    
    
    
    func fromNib<T>(type : T.Type) -> T {
        UINib(nibName: self.rawValue, bundle: nil).instantiate(withOwner: nil, options: nil).first as! T
    }
    
    func asNib() -> UINib {
        UINib(nibName: self.rawValue, bundle: nil)
    }
}

