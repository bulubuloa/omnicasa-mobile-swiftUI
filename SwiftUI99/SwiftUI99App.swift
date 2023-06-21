//
//  SwiftUI99App.swift
//  SwiftUI99
//
//  Created by Omnimobile on 6/9/23.
//

import SwiftUI

@main
struct SwiftUI99App: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    private let loginViewModel: LoginViewModel
    
    init() {
        self.loginViewModel = LoginViewModel()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                LoginView(viewModel: loginViewModel)
            }
        }
    }
}
    
