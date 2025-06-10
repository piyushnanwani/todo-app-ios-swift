//
//  HomeView.swift
//  Todo App3
//
//  Created by Piyush Nanwani on 09/06/25.
//

import SwiftUI
import FirebaseFirestore
import FirebaseAuth

struct HomeView: View {
    @State private var newTodo = ""
    @State private var todos: [String] = []
    
    let db = Firestore.firestore()
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Your Todo List")
                .font(.title)
                .bold()
            
            HStack {
                TextField("Enter task", text: $newTodo)
                    .textFieldStyle(.roundedBorder)
                
                Button(action: {
                    if !newTodo.isEmpty {
                        todos.append(newTodo)
                        newTodo = ""
                    }
                }) {
                    Image(systemName: "plus.circle.fill")
                        .font(.title)
                }
            }
            
            List {
                ForEach(todos, id: \.self) {
                    item in Text(item)
                }
            }
            
        }
    }
    
    func addTodo() {
        guard let uid = Auth.auth().currentUser?.uid else { return }

        db.collection("users").document(uid).collection("todos").addDocument(data: [
            "text": newTodo,
            "timestamp": Date()
        ])
        newTodo = ""
        fetchTodos()
    }
    
    func fetchTodos() {
         guard let uid = Auth.auth().currentUser?.uid else { return }

         db.collection("users").document(uid).collection("todos")
             .order(by: "timestamp", descending: true)
             .getDocuments { snapshot, error in
                 if let documents = snapshot?.documents {
                     todos = documents.compactMap { $0["text"] as? String }
                 }
             }
     }
}

#Preview {
    HomeView()
}
