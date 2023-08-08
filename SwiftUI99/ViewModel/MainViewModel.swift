//
//  MainViewModel.swift
//  SwiftUI99
//
//  Created by Omnimobile on 6/21/23.
//

import Foundation

class MainViewModel: BaseViewModel {
    let authenticationService: IAuthenticationService = AuthenticationService()
    
    @Published var tokenExpired: String = ""
    
    func checkTokenAlive() {
         authenticationService.oauthTokenExpired() {
            res in
            DispatchQueue.main.async {
                switch res {
                    case .success(let expired):
                        self.tokenExpired = "Token expired, need to re-login = \(expired)"
                        self.settingDataStore.saveSetting(keyName: SettingKeys.oauthToken.rawValue, keyValue: nil)
                    case .failure(let error):
                        self.tokenExpired = "Token still alive, continue to use \(error.localizedDescription)"
                }
            }
        }
    }
}
