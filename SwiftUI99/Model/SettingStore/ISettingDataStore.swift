//
//  ISettingDataStore.swift
//  SwiftUI99
//
//  Created by Omnimobile on 6/21/23.
//

import Foundation

protocol ISettingDataStore {
    func saveSetting(keyName: String, keyValue: String?) -> Bool
    func getSetting(keyName: String) -> String?
}
