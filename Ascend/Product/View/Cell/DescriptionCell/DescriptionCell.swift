//
//  DescriptionCell.swift
//  Ascend
//
//  Created by Mehmet  on 4.10.2023.
//

import UIKit

class DescriptionCell: UITableViewCell, BaseEditableCell {
  
    
    @IBOutlet var textView: ProductTextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        textView.placeholder = StringKeys.NewDocuments.textViewHint.rawValue
        textView.isScrollEnabled = false
        textView.backgroundColor = .clear
        backgroundColor = .clear
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
