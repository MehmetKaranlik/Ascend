//
//  Paddings.swift
//  Ascend
//
//  Created by Mehmet  on 29.09.2023.
//

import Foundation
import UIKit

private protocol PaddingItems {
    var xLow : UIEdgeInsets { get set }
    var low  : UIEdgeInsets { get set }
    var normal  : UIEdgeInsets { get set }
    var standart  : UIEdgeInsets { get set }
    var medium   : UIEdgeInsets { get set }
    var large  : UIEdgeInsets { get set }
    var xLarge : UIEdgeInsets { get set }
}

struct Paddings {
    static let onlyTop = OnlyTop.shared
    static let onlyBottom = OnlyBottom.shared
    static let onlyLeft = OnlyLeft.shared
    static  let onylRight = OnlyRight.shared
    static let horizontal = Horizontal.shared
    static let vertical = Vertical.shared
    
    struct OnlyTop : PaddingItems {
        private init(){}
        fileprivate static let shared = OnlyTop()
        var  xLow: UIEdgeInsets = 4.top()
        var low: UIEdgeInsets = 8.top()
        var normal: UIEdgeInsets = 12.top()
        var standart: UIEdgeInsets = 16.top()
        var medium: UIEdgeInsets = 24.top()
        var large: UIEdgeInsets = 32.top()
        var xLarge: UIEdgeInsets = 54.top()
    }
    
    
    struct OnlyBottom : PaddingItems  {
        private init(){}
        fileprivate static let shared = OnlyBottom()
        var xLow: UIEdgeInsets = 4.bottom()
        var low: UIEdgeInsets = 8.bottom()
        var normal: UIEdgeInsets = 12.bottom()
        var standart: UIEdgeInsets = 16.bottom()
        var medium: UIEdgeInsets = 24.bottom()
        var large: UIEdgeInsets = 32.bottom()
        var xLarge: UIEdgeInsets = 54.bottom()
    }
    
    struct OnlyLeft : PaddingItems {
        private init(){}
        fileprivate static let shared = OnlyLeft()
        var xLow: UIEdgeInsets = 4.left()
        var low: UIEdgeInsets = 8.left()
        var normal: UIEdgeInsets = 12.left()
        var standart: UIEdgeInsets = 16.left()
        var medium: UIEdgeInsets = 24.left()
        var large: UIEdgeInsets = 32.left()
        var xLarge: UIEdgeInsets = 54.left()
    }
    
    struct OnlyRight : PaddingItems {
        private init(){}
        fileprivate static let shared = OnlyRight()
        var xLow: UIEdgeInsets = 4.right()
        var low: UIEdgeInsets = 8.right()
        var normal: UIEdgeInsets = 12.right()
        var standart: UIEdgeInsets = 16.right()
        var medium: UIEdgeInsets = 24.right()
        var large: UIEdgeInsets = 32.right()
        var xLarge: UIEdgeInsets = 54.right()
    }
    
    
    struct Horizontal : PaddingItems {
        private init(){}
        fileprivate static let shared = Horizontal()
        var xLow: UIEdgeInsets = 4.left() + 4.right()
        var low: UIEdgeInsets = 8.left() + 8.right()
        var normal: UIEdgeInsets = 12.left() + 12.right()
        var standart: UIEdgeInsets = 16.left() + 16.right()
        var medium: UIEdgeInsets = 24.left() + 24.right()
        var large: UIEdgeInsets = 32.left() + 32.right()
        var xLarge: UIEdgeInsets = 54.left() + 54.right()
    }
    
    struct Vertical : PaddingItems {
        private init(){}
        fileprivate static let shared = Vertical()
        var xLow: UIEdgeInsets = 4.top() + 4.bottom()
        var low: UIEdgeInsets = 8.top() + 8.bottom()
        var normal: UIEdgeInsets = 12.top() + 12.bottom()
        var standart: UIEdgeInsets = 16.top() + 16.bottom()
        var medium: UIEdgeInsets = 24.top() + 24.bottom()
        var large: UIEdgeInsets = 32.top() + 32.bottom()
        var xLarge: UIEdgeInsets = 54.top() + 54.bottom()
    }
}



private extension Int {
     func bottom()  -> UIEdgeInsets {
         return UIEdgeInsets(top: 0, left: 0, bottom: CGFloat(self), right: 0)
    }
    
     func top()  -> UIEdgeInsets {
        return UIEdgeInsets(top: CGFloat(self), left: 0, bottom: 0, right: 0)
    }
    
     func left() -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: CGFloat(self), bottom: 0, right: 0)
    }
    
     func right () -> UIEdgeInsets  {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: CGFloat(self))
    }
}


 extension UIEdgeInsets {
    static func +(lhs:UIEdgeInsets,rhs :UIEdgeInsets) -> UIEdgeInsets {
        return UIEdgeInsets(
            top: lhs.top + rhs.top,
            left: lhs.left + rhs.left,
            bottom: lhs.bottom + rhs.bottom,
            right: lhs.right + rhs.right
        )
    }
    
    func toNs() -> NSDirectionalEdgeInsets {
        return .init(top: self.top, leading: self.left, bottom: self.bottom, trailing: self.right)
    }
}
