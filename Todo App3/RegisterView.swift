//
//  RegisterView.swift
//  Todo App3
//
//  Created by Piyush Nanwani on 09/06/25.
//

import SwiftUI

struct RegisterView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var username = ""
    @State private var password = ""
    var body: some View {
        VStack(spacing: 20) {
            Text("Register")
                .font(.title)
                .bold()
            
            TextField("Username", text: $username)
                .textFieldStyle(.roundedBorder)
            
            SecureField("Password", text: $password)
                .textFieldStyle(.roundedBorder)
            
            Button("Register") {
                presentationMode.wrappedValue.dismiss()
            }
        }
    }
}

#Preview {
    RegisterView()
}
