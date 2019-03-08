//
//  UIText.swift
//  jopFinder
//
//  Created by Yasin on 3/6/19.
//  Copyright © 2019 Yasin. All rights reserved.
//

import Foundation
import UIKit

extension UITextField{
    
    @IBInspectable var doneAccessory: Bool{
        get{
            return self.doneAccessory
        }
        set {
            if newValue{
                addDoneButtonOnKeyboard()
            }
        }
    }
    
    @IBInspectable var doneAccessoryIcon: UIImage?{
        get{
            return getDoneButton()?.image
        }
        set {
            if newValue != nil{
                let done = getDoneButton()
                if done != nil{
                    done?.image = newValue
                    done?.tintColor = UIColor.black
                }
            }
        }
    }
    
    func addDoneButtonOnKeyboard()
    {
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolbar.barStyle = .default
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)

        let done: UIBarButtonItem = UIBarButtonItem(title: Constants.done , style: .done, target: self, action: #selector(self.doneButtonAction))
        done.tag = 100
        
        let items = [flexSpace, done]
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        self.inputAccessoryView = doneToolbar
    }
    
    func getDoneButton() -> UIBarButtonItem?{
        let toolbar = inputAccessoryView as? UIToolbar
        if toolbar == nil{
            return nil
        }
        
        let done = toolbar!.items!.filter { $0.tag == 100 }
        
        if done.isEmpty{
            return nil
        }
        return done[0]
    }
    
    @objc func doneButtonAction()
    {
        self.resignFirstResponder()
    }
}
