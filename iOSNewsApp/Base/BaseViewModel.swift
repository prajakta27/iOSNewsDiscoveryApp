//
//  BaseViewModel.swift
//  iOSNewsApp
//
//  Created by Prajakta Kiran Patil on 14/11/22.
//

import Foundation
class BaseViewModel: NSObject {
    override init() {
        super.init()
        callService()
    }

    public func callService() {
        // childs should implement this
    }
}
