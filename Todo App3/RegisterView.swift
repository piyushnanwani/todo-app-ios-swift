//
//  RegisterView.swift
//  Todo App3
//
//  Created by Piyush Nanwani on 09/06/25.
//

import SwiftUI
import FirebaseAuth
struct RegisterView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var email = ""
    @State private var password = ""
    @State private var errorMessage = ""
    var body: some View {
        VStack(spacing: 20) {
            Text("Register")
                .font(.title)
                .bold()
            
            TextField("Email", text: $email)
                .textFieldStyle(.roundedBorder)
            
            SecureField("Password", text: $password)
                .textFieldStyle(.roundedBorder)
            
            Button("Register") {
                Auth.auth().createUser(withEmail: email, password: password ) {
                    result, error in if let error = error {
                        errorMessage = error.localizedDescription
                    } else {
                        presentationMode.wrappedValue.dismiss()
                    }
                }

            }
            
            if !errorMessage.isEmpty {
                Text(errorMessage)
                    .foregroundStyle(.red)
            }
        }
    }
}

#Preview {
    RegisterView()
}
