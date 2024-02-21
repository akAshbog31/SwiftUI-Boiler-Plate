//
//  Ext+UIApplication.swift
//  SwiftUIBoilerPlate
//
//  Created by AKASH BOGHANI on 21/02/24.
//

import UIKit

extension UIApplication {
    static var keyWindow: UIWindow? {
        shared.connectedScenes.compactMap { ($0 as? UIWindowScene)?.keyWindow }.last
    }
}
