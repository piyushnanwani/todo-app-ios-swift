//
//  ContentView.swift
//  Todo App3
//
//  Created by Piyush Nanwani on 09/06/25.
//

import SwiftUI

struct ContentView: View {
    @State private var showHomeView: Bool = false
    @State private var isRegister = false
    
    var body: some View {
        
        NavigationView {
            VStack(spacing: 20) {
                Text("Todo App")
                    .font(.largeTitle)
                    .bold()
                NavigationLink(destination: HomeView(),
                               isActive: $showHomeView
                ) {
                    EmptyView()
                }
                
                Button("Login") {
                    showHomeView = true
                }
                .buttonStyle(.borderedProminent)
                
                Button("Register") {
                    isRegister = true
                }
                .buttonStyle(.bordered)
                
                NavigationLink(destination: RegisterView(), isActive: $isRegister) {
                    EmptyView()
                }
                
            }
            .padding()
        }

        
        
    }
}

#Preview {
    ContentView()
}
