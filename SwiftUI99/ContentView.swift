//
//  ContentView.swift
//  SwiftUI99
//
//  Created by Omnimobile on 6/9/23.
//

import SwiftUI

struct ContentView: View {
    @State var tapCount = 0

    var body: some View {
        
        NavigationView {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Hello, world!")
                Button("Tap to count \(tapCount)") {
                    self.tapCount += 1
                }
            }
            .padding()
        }
        .navigationTitle("Login")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            Button("Login", action: {
                
            })
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
