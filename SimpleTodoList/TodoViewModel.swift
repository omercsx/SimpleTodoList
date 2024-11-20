//
//  TodoViewModel.swift
//  SimpleTodoList
//
//  Created by Omer Cagri Sayir on 20.11.2024.
//

import Foundation

class TodoViewModel {
    var todos: [Todo] = [
        Todo(title: "First to-do", isCompleted: false),
        Todo(title: "Second to-do", isCompleted: false),
        Todo(title: "Third to-do", isCompleted: true),
    ]
}
