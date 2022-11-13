//
//  Enums.swift
//  iOSNewsApp
//
//  Created by Prajakta Kiran Patil on 14/11/22.
//

import Foundation

enum CountryEnum: String, CaseIterable, Codable {
    case us
    case canada

    var systemName: String {
        switch self {
        case .us:
            return "us"
        case .canada:
            return "canada"
        }
    }
}
