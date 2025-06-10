//
//  LoginView.swift
//  Todo App3
//
//  Created by Piyush Nanwani on 10/06/25.
//

import SwiftUI
import FirebaseAuth
struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var goToHome = false
    @State private var errorMessage = ""

    var body: some View {
        VStack(spacing: 20) {
            Text("Login")
                .font(.title)
            
            TextField("Email", text: $email)
                .autocapitalization(.none)
                .textFieldStyle(.roundedBorder)
     
            SecureField("Password", text: $password)
                .textFieldStyle(.roundedBorder)
     
            Button("Login") {
                Auth.auth().sign(withEmail: email, password: password) {
                    result, error in
                    if let error = error {
                        errorMessage = error.localizedDescription
                    } else {
                        goToHome = true
                    }
                }
            }
            
            if !errorMessage.isEmpty {
                Text(errorMessage)
                    .foregroundStyle(.red)
            }
            
            NavigationLink(destination: HomeView(), isActive: $goToHome) {
                EmptyView()
            }
        }
        .padding()
    }
}

#Preview {
    LoginView()
}
