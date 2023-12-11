//
//  Ext+DispatchQueue.swift
//  SwiftUIDemo
//
//  Created by iOS Developer on 11/12/23.
//

import Foundation

extension DispatchQueue {
    public func after(time interval: TimeInterval, work: @escaping () -> Void) {
        asyncAfter(deadline: .now() + interval) {
            work()
        }
    }
}
