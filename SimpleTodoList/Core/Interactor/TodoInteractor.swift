//
//  TodoInteractor.swift
//  SimpleTodoList
//
//  Created by Omer Cagri Sayir on 27.11.2024.
//

import Foundation

class TodoInteractor: TodoPresenterToInteractorProtocol {
    var presenter: TodoInteractorToPresenterProtocol?
    
    var todos: [Todo] = []
    
    func getTodos() {
        todos = [
            Todo(title: "First to-do", description: "This is the first to-do", isCompleted: false, createdAt: Date()),
            Todo(title: "Second to-do", description: "This is the second to-do", isCompleted: false, createdAt: Date()),
            Todo(title: "Third to-do", description: "This is the third to-do", isCompleted: true, createdAt: Date()),
        ]
        
        presenter?.didGetTodos(todos: todos)
    }
    
    func presenterDidGetTodos(todos: [Todo]) {
        presenter?.didGetTodos(todos: todos)
    }
}
