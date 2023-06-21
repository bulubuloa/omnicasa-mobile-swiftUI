//
//  LoginViewModel.swift
//  SwiftUI99
//
//  Created by Omnimobile on 6/20/23.
//

import Foundation

class LoginViewModel: ObservableObject{
    private var authenticationManager : IAppAuthManager
    
    @Published var userName: String = "userName"
    @Published var password: String = "passWord"
    
    init() {
        self.authenticationManager = AppAuthManager()
    }
    
    func startLoginByOAuth() {
        authenticationManager.startLogin()
    }
}
