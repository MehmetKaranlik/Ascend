//
//  DateHelpers.swift
//  Ascend
//
//  Created by Mehmet  on 1.10.2023.
//

import Foundation


class DateHelpers {
    private init(){}
    static func currentDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM d, hh:mm"
        let date = formatter.string(from: Date())
        return date.description
    }
}
