//
//  UIView.swift
//  jopFinder
//
//  Created by Yasin on 3/5/19.
//  Copyright © 2019 Yasin. All rights reserved.
//

import UIKit

@IBDesignable
extension UIView {
    
    private static var _viewComputedProperty = [String:Bool]()
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var borderColor: UIColor {
        get {
            return  UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
}
