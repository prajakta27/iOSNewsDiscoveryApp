//
//  Settings.swift
//  iOSNewsApp
//
//  Created by Prajakta Kiran Patil on 14/11/22.
//

import Foundation
struct Settings {
    static var shared = Settings()

    static let CountryKey = "country"
    static let CountryDefault: CountryEnum = .us
  

    var country: CountryEnum = UserDefaultsConfig.savedCountry {
        didSet {
            UserDefaultsConfig.savedCountry = country
        }
    }
}

struct UserDefaultsConfig {

    @UserDefault(Settings.CountryKey, defaultValue: Settings.CountryDefault)
    static var savedCountry: CountryEnum
}
