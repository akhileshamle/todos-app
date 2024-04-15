//
//  todos_appApp.swift
//  todos-app
//
//  Created by Akhilesh Amle on 15/04/24.
//

import ComposableArchitecture
import SwiftUI

@main
struct todos_appApp: App {
    var body: some Scene {
        WindowGroup {
            TodoListView(
                store: Store(initialState: TodoList.State()) {
                    TodoList()
                }
            )
        }
    }
}
