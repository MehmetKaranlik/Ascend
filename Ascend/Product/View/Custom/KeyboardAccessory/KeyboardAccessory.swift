//
//  KeyboardAccessory.swift
//  Ascend
//
//  Created by Mehmet  on 1.10.2023.
//

import Foundation
import UIKit


protocol KeyboardAccessoryProtocol : AnyObject{
    func onTapMic()
    func onTapGallery()
    func onTapCalendar()
    func onTapCheckbox()
}

class KeyboardAccessory : UIToolbar {
    
    weak var actionDelegate : KeyboardAccessoryProtocol?
  
    @IBAction func didPressMic(_ sender: Any) {
        actionDelegate?.onTapMic()
    }
    
    
    @IBAction func didPressGallery(_ sender: Any) {
        actionDelegate?.onTapGallery()
    }
    
    
    @IBAction func didPressCalendar(_ sender: Any) {
        actionDelegate?.onTapCalendar()
    }
    
    @IBAction func didPressCheckbox(_ sender: Any) {
        actionDelegate?.onTapCheckbox()
    }
}
