//
//  TodoList.swift
//  todos-app
//
//  Created by Akhilesh Amle on 16/04/24.
//

import ComposableArchitecture

@Reducer
struct TodoList {
    @ObservableState
    struct State: Equatable {
        var todos: IdentifiedArrayOf<Todo.State> = []
    }
    
    enum Action: BindableAction  {
        case binding(BindingAction<State>)
        case didSelectAddTodo
        case todos(IdentifiedActionOf<Todo>)
    }
    
    @Dependency(\.uuid) var uuid
    
    var body: some Reducer<State,Action> {
        BindingReducer()
        Reduce { state, action in
            switch action {
            case .binding(_):
                return .none
            case .didSelectAddTodo:
                state.todos.insert(
                    Todo.State(id: self.uuid()), at: 0
                )
                return .none
            case .todos(_):
                return .none
            }
        }
        .forEach(\.todos, action: \.todos) {
            Todo()
        }
    }
}
