//
//  TodoPresenter.swift
//  SimpleTodoList
//
//  Created by Omer Cagri Sayir on 27.11.2024.
//

import Foundation

class TodoPresenter: TodoInteractorToPresenterProtocol {
    var view: TodoPresenterToViewProtocol?
    var interactor: TodoPresenterToInteractorProtocol?
    var router: MainRouterProtocol?
    
    init(view: TodoPresenterToViewProtocol, interactor: TodoPresenterToInteractorProtocol, router: MainRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func didGetTodos(todos: [Todo]) {
        view?.didGetTodos(todos: todos)
    }
}

extension TodoPresenter: TodoViewToPresenterProtocol {
    func getTodos() {
        interactor?.getTodos()
    }
    
    func didSelectTodo(at index: Int) {
        guard let todo = interactor?.getTodo(at: index) else { return }
        router?.presentDetailTodo(with: todo)
    }
}
