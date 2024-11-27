//
//  TodoProtocols.swift
//  SimpleTodoList
//
//  Created by Omer Cagri Sayir on 27.11.2024.
//

import Foundation

protocol TodoPresenterToInteractorProtocol {
    func getTodos()
}

protocol TodoInteractorToPresenterProtocol {
    func didGetTodos(todos: [Todo])
}

protocol TodoPresenterToViewProtocol {
    func didGetTodos(todos: [Todo])
}

protocol TodoViewToPresenterProtocol {
    func getTodos()
}
