//
//  TodoListView.swift
//  todos-app
//
//  Created by Akhilesh Amle on 16/04/24.
//

import ComposableArchitecture
import SwiftUI

struct TodoListView: View {
    @Bindable var store: StoreOf<TodoList>
    var body: some View {
        NavigationStack {
            List {
                ForEach(
                    store.scope(
                        state: \.todos,
                        action: \.todos
                    )
                ) { todo in
                    TodoItemView(store: todo)
                }
            }
            .navigationTitle("todos")
            .navigationBarItems(
                trailing: HStack {
                    Button("add todo") {
                        store.send(.didSelectAddTodo)
                    }
                }
            )
        }
    }
}

extension IdentifiedArray where ID == Todo.State.ID, Element == Todo.State {
    static let mock: Self = [
        Todo.State(id: UUID()),
        Todo.State(id: UUID()),
        Todo.State(id: UUID()),
    ]
}

#Preview {
    TodoListView(
        store: Store(initialState: TodoList.State(todos: .mock)) {
            TodoList()
        }
    )
}
