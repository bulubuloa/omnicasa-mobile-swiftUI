//
//  SettingDataStore.swift
//  SwiftUI99
//
//  Created by Omnimobile on 6/21/23.
//

import Foundation

class SettingDataStore: ISettingDataStore {
    func saveSetting(keyName: String, keyValue: String?) -> Bool {
        let defaults = getSetting()
        defaults.set(keyValue, forKey: keyName)
        return true
    }
    
    func getSetting(keyName: String) -> String? {
        getSetting().string(forKey: keyName)
    }
    
    func getSetting() -> UserDefaults {
        return UserDefaults.standard
    }
}
