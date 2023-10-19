//
//  Fonts.swift
//  Ascend
//
//  Created by Mehmet  on 30.09.2023.
//

import Foundation
import UIKit


private enum Fonts : String {
    case  black = "MontserratAlternates-Black"
    case  extraBold = "MontserratAlternates-ExtraBold"
    case  bold = "MontserratAlternates-Bold"
    case  semiBold = "MontserratAlternates-SemiBold"
    case  medium = "MontserratAlternates-Medium"
    case  regular = "MontserratAlternates-Regular"
    case  light = "MontserratAlternates-Light"
}


enum FontStyle {
    case extraLargeTitle
    case extraLargeTitle2
    case largeTitle
    case title1
    case title2
    case title3
    case headline
    case subheadline
    case body
    case callout
    case footnote
    case caption1
    case caption2
    
    func toFont() -> UIFont? {
        switch self {
        case .extraLargeTitle:
            return UIFont(name: Fonts.bold.rawValue, size: 38)
        case .extraLargeTitle2:
            return UIFont(name: Fonts.bold.rawValue, size: 28)
        case .largeTitle:
            return UIFont(name: Fonts.regular.rawValue, size: 34)
        case .title1:
            return UIFont(name: Fonts.regular.rawValue, size: 28)
        case .title2:
            return UIFont(name: Fonts.regular.rawValue, size: 22)
        case .title3:
            return UIFont(name: Fonts.regular.rawValue, size: 20)
        case .headline:
            return UIFont(name: Fonts.semiBold.rawValue, size: 17)
        case .subheadline:
            return UIFont(name: Fonts.regular.rawValue, size: 15)
        case .body:
            return UIFont(name: Fonts.regular.rawValue, size: 17)
        case .callout:
            return UIFont(name: Fonts.regular.rawValue, size: 13)
        case .footnote:
            return UIFont(name: Fonts.regular.rawValue, size: 13)
        case .caption1:
            return UIFont(name: Fonts.regular.rawValue, size: 12)
        case .caption2:
            return UIFont(name: Fonts.regular.rawValue, size: 11)
        }
    }
}


