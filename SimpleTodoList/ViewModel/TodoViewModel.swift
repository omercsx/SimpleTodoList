//
//  TodoViewModel.swift
//  SimpleTodoList
//
//  Created by Omer Cagri Sayir on 20.11.2024.
//

import Foundation

class TodoViewModel {
    var todos: [Todo] = [
        Todo(title: "First to-do", description: "This is the first to-do", isCompleted: false, createdAt: Date()),
        Todo(title: "Second to-do", description: "This is the second to-do", isCompleted: false, createdAt: Date()),
        Todo(title: "Third to-do", description: "This is the third to-do", isCompleted: true, createdAt: Date()),
    ]
}
