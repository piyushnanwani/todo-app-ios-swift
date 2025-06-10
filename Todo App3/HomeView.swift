//
//  HomeView.swift
//  Todo App3
//
//  Created by Piyush Nanwani on 09/06/25.
//

import SwiftUI

struct HomeView: View {
    @State private var newTodo = ""
    @State private var todos: [String] = []
    
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
}

#Preview {
    HomeView()
}
