//
//  HTTPError.swift
//  iOSNewsApp
//
//  Created by Prajakta Kiran Patil on 14/11/22.
//

import Foundation
enum HTTPError: Error {
    case urlFailed
    case noData
    case requestError
    case parsingFailed
}
