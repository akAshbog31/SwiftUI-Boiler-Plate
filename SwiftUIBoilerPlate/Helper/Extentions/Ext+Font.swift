//
//  Ext+Font.swift
//  SwiftUIDemo
//
//  Created by iOS Developer on 11/12/23.
//

import SwiftUI

extension Font {
    static func poppins(_ size: CGFloat, _ weight: Font.Weight = .regular) -> Self {
        switch weight {
        case .black: return .custom("Poppins-Black", size: size.asDeviceWidth)
        case .bold: return .custom("Poppins-Bold", size: size.asDeviceWidth)
        case .heavy: return .custom("Poppins-ExtraBold", size: size.asDeviceWidth)
        case .light: return .custom("Poppins-Light", size: size.asDeviceWidth)
        case .medium: return .custom("Poppins-Medium", size: size.asDeviceWidth)
        case .regular: return .custom("Poppins-Regular", size: size.asDeviceWidth)
        case .semibold: return .custom("Poppins-SemiBold", size: size.asDeviceWidth)
        case .thin: return .custom("Poppins-Thin", size: size.asDeviceWidth)
        case .ultraLight: return .custom("Poppins-ExtraLight", size: size.asDeviceWidth)
        default: fatalError("\(Font.self) \(weight) is not yet supported")
        }
    }
}
