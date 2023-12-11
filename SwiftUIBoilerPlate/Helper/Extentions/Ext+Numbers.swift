//
//  Ext+Numbers.swift
//  SwiftUIDemo
//
//  Created by iOS Developer on 11/12/23.
//

import UIKit

//MARK: - Int
extension Int {
    var asDeviceHeight: CGFloat {
        return CGFloat(self) * UIScreen.main.bounds.size.height / 812
    }
    
    var asDeviceWidth: CGFloat {
        return CGFloat(self) * UIScreen.main.bounds.size.width / 430
    }
}

//MARK: - Double
extension Double {
    var asDeviceHeight: CGFloat {
        return CGFloat(self) * UIScreen.main.bounds.size.height / 812
    }
    
    var asDeviceWidth: CGFloat {
        return CGFloat(self) * UIScreen.main.bounds.size.width / 430
    }
}

//MARK: - Float
extension Float {
    var asDeviceHeight: CGFloat {
        return CGFloat(self) * UIScreen.main.bounds.size.height / 812
    }
    
    var asDeviceWidth: CGFloat {
        return CGFloat(self) * UIScreen.main.bounds.size.width / 430
    }
}

//MARK: - CGFloat
extension CGFloat {
    var asDeviceHeight: CGFloat {
        return self * UIScreen.main.bounds.size.height / 812
    }
    
    var asDeviceWidth: CGFloat {
        return self * UIScreen.main.bounds.size.width / 430
    }
}
