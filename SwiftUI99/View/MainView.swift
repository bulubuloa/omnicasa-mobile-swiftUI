//
//  MainView.swift
//  SwiftUI99
//
//  Created by Omnimobile on 6/21/23.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var viewModel: MainViewModel
    
    init() {
        self.viewModel = MainViewModel()
    }
    
    var body: some View {
        VStack {
            Text("MainView")
            ProgressView()
            Text(viewModel.tokenExpired)
        }
        .task {
            viewModel.checkTokenAlive()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
