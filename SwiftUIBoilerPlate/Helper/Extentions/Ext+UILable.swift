//
//  Ext+UILable.swift
//  SwiftUIDemo
//
//  Created by iOS Developer on 11/12/23.
//

import UIKit

@IBDesignable
extension UILabel {
    @IBInspectable
    var dynamicFontSize: CGFloat {
        get {
            self.dynamicFontSize
        }
        set {
            let size = newValue * UIScreen.main.bounds.size.width / 430
            font = UIFont(name: font.fontName, size: size)
        }
    }
}
