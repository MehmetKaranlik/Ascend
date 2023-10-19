//
//  SystemImages.swift
//  Ascend
//
//  Created by Mehmet  on 1.10.2023.
//

import Foundation
import UIKit

enum SystemImages : String {
    case chevronLeft = "chevron.left"
    
    
    
    func uiImage() -> UIImage {
        return UIImage(systemName: self.rawValue)!
    }
}
