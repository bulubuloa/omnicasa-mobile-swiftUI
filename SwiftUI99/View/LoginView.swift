//
//  LoginView.swift
//  SwiftUI99
//
//  Created by Omnimobile on 6/9/23.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject var viewModel: LoginViewModel
    
    init() {
        self.viewModel = LoginViewModel()
    }
    
    var body: some View {
        VStack {
            VStack {
                Image(systemName: "globe")
                    .padding(EdgeInsets(top: 10, leading: 0, bottom: 20, trailing: 0))
                
                TextField("Username", text: $viewModel.userName)
                    .frame(height: 40)
                    .textFieldStyle(.plain)
                    .font(Font.system(size: 14, design: .default))
                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                Text("")
                    .background(.green)
                    .frame(maxWidth: .infinity, maxHeight: 1)
                    .border(.gray)
                    .opacity(0.2)
                TextField("Password", text: $viewModel.password)
                    .frame(height: 40)
                    .textFieldStyle(.plain)
                    .font(Font.system(size: 14, design: .default))
                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))

                
                Button("Login", action: viewModel.startLoginByOAuth)
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .padding(EdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 0))
                    .background(.blue)
                    .foregroundColor(.white)
            }
            .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
            .background(.white)
            .cornerRadius(20)
            .overlay(RoundedRectangle(cornerRadius: 20).stroke(.blue, lineWidth: 1))
            
            Text("Login via OAuth")
                .padding(EdgeInsets(top: 50, leading: 0, bottom: 0, trailing: 0))
                .font(Font.system(size: 15, design: .default))
                .onTapGesture {
                }
        }
        .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
    }
}
