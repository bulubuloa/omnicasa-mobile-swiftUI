//
//  WelcomeViewModel.swift
//  SwiftUI99
//
//  Created by Omnimobile on 6/21/23.
//

import Foundation

class WelcomeViewModel: BaseViewModel {
    override init() {
    }
    
    func isAuthenticated() -> Bool {
        let authToken = getOAuthToken()
        return authToken != nil
    }
}
