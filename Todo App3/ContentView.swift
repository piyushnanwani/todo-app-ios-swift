//
//  ContentView.swift
//  Todo App3
//
//  Created by Piyush Nanwani on 09/06/25.
//

import SwiftUI

struct ContentView: View {
    @State private var showLogin = false
    @State private var showRegister = false
    
    var body: some View {
        
        NavigationView {
            VStack(spacing: 20) {
                Text("Todo App")
                    .font(.largeTitle)
                    .bold()
                
                NavigationLink(destination: LoginView(),
                               isActive: $showLogin
                ) {
                    EmptyView()
                }
                
                
                NavigationLink(destination: RegisterView(), isActive: $showRegister) {
                    EmptyView()
                }
                
                
                Button("Login") {
                    showLogin = true
                }
                .buttonStyle(.borderedProminent)
                
                Button("Register") {
                    showRegister = true
                }
                .buttonStyle(.bordered)

            }
            .padding()
        }

        
        
    }
}

#Preview {
    ContentView()
}
