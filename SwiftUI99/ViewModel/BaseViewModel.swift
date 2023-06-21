//
//  BaseViewModel.swift
//  SwiftUI99
//
//  Created by Omnimobile on 6/21/23.
//

import Foundation

class BaseViewModel: ObservableObject {
    let settingDataStore: ISettingDataStore = SettingDataStore()
    
    init() {
        
    }
    
    func getOAuthToken() -> String? {
        return settingDataStore.getSetting(keyName: SettingKeys.oauthToken.rawValue)
    }
}
