//
//  TableViewLoader.swift
//  Ascend
//
//  Created by Mehmet  on 5.10.2023.
//

import UIKit


enum TableCells : String  {
    case description = "DescriptionCell"
    case checkBoxRow = "CheckBoxRowCell"
    
    
    func deque(_ with : UITableView, indexPath: IndexPath) -> any BaseEditableCell {
        return with.dequeueReusableCell(withIdentifier: self.rawValue, for: indexPath) as! (any BaseEditableCell)
    }
    
    func register(_ with : UITableView, _ nib : Nibs) -> Void {
        with.register(nib.asNib(), forCellReuseIdentifier: self.rawValue)
    }
}
