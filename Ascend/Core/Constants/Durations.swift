//
//  Durations.swift
//  Ascend
//
//  Created by Mehmet  on 29.09.2023.
//

import Foundation


enum Durations {
    case low,medium,high

    func time()  ->  DispatchTime {
        switch self {
        case .low:
            return .now() + 0.5
        case .medium:
            return .now() + 1
        case .high:
            return .now() + 2
        }
    }
}

