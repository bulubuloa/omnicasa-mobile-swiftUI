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
        TabView {
            AgendaScheduleView()
                .tabItem() {
                    Label("Agenda", systemImage: "list.bullet.clipboard.fill")
                }
            PropertyPageView()
                .tabItem() {
                    Label("Property", systemImage: "house.fill")
                }
            PersonPageView()
                .tabItem() {
                    Label("Contact", systemImage: "person.2.circle")
                }
            TaskPageView()
                .tabItem() {
                    Label("Task", systemImage: "checklist")
                }
            PerferencePageView()
                .tabItem() {
                    Label("...", systemImage: "ellipsis")
                }
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
