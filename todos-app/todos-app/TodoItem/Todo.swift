//
//  Todo.swift
//  todos-app
//
//  Created by Akhilesh Amle on 16/04/24.
//

import ComposableArchitecture
import Foundation

// Todo - Reducer for a single item
@Reducer
struct Todo {
    // State - ObservableState - info for the item
    @ObservableState
    struct State: Equatable, Identifiable {
        var description = ""
        var isCompleted = false
        let id: UUID
    }
    
    // Action - BindableAction - .binding action
    enum Action: BindableAction {
        case binding(BindingAction<State>)
    }
    
    var body: some Reducer<State, Action> {
        BindingReducer()
    }
}
