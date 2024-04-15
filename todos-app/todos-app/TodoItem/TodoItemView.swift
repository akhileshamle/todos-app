//
//  TodoItemView.swift
//  todos-app
//
//  Created by Akhilesh Amle on 16/04/24.
//

import ComposableArchitecture
import SwiftUI

struct TodoItemView: View {
    @Bindable var store: StoreOf<Todo>
    
    var body: some View {
        HStack {
            Button {
                store.isCompleted.toggle()
            } label: {
                Image(
                    systemName: store.isCompleted ? "checkmark.square" : "square"
                )
            }
            .buttonStyle(
                .plain
            )
            
            TextField(
                "empty todo",
                text: $store.description
            )
        }
    }
}

#Preview {
    TodoItemView(
        store:
            Store(
                initialState: Todo.State(
                    id: UUID()
                )) {
                    Todo()
                }
    )
}
