//
//  WelcomeView.swift
//  SwiftUI99
//
//  Created by Omnimobile on 6/21/23.
//

import SwiftUI

struct WelcomeView: View {
    @ObservedObject var viewModel: WelcomeViewModel
    
    init() {
        viewModel = WelcomeViewModel()
    }
    
    var body: some View {
        if viewModel.isAuthenticated() {
            MainView()
        } else {
            LoginView()
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
