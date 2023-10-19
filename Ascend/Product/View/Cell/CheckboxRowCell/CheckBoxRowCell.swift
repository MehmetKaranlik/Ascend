//
//  CheckBoxRowCell.swift
//  Ascend
//
//  Created by Mehmet  on 5.10.2023.
//

import STTextView
import UIKit

class CheckBoxRowCell: UITableViewCell, BaseEditableCell {
 
    
    @IBOutlet var textView: ProductTextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        textView.textColor = .white
        textView.textViewOnChanged = onEdit
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(_ keyboardAccessory: KeyboardAccessory) {
        textView.inputAccessoryView = keyboardAccessory
     
    }
    
    func onEdit() {
        guard let parent = superview as? UITableView
        else { return }
        parent.performBatchUpdates(nil)
    }
}
