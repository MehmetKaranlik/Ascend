//
//  StringKeys.swift
//  Ascend
//
//  Created by Mehmet  on 25.09.2023.
//

import Foundation



protocol Localizable<T> {
    associatedtype T : RawRepresentable where T.RawValue == String
}

class StringKeys {
    
    enum General : String, Localizable {
        typealias T = General
        case appName = "ASCEND"
    }
    
    enum Splash : String, Localizable {
        typealias T = Splash
        case desc = "Yourself"
    }
    
    enum Onboarding : String, Localizable {
        typealias T = Onboarding
        case daily = "Daily Notes"
        case desc = "Take notes, reminderds, set targets\ncollect resources and secure privacy"
    }
    
    enum Buttons : String , Localizable {
        typealias T = Buttons
        case getStarted = "Get Started"
        case done = "Done"
    }
    
    enum NewDocuments : String , Localizable {
        typealias T = NewDocuments
        case inputTitle = "Title here"
        case textViewHint = "Start writing here..."
        
    }
}
