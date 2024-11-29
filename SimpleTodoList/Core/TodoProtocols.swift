//
//  TodoProtocols.swift
//  SimpleTodoList
//
//  Created by Omer Cagri Sayir on 27.11.2024.
//

import Foundation

protocol TodoPresenterToInteractorProtocol {
    func getTodos()
    func getTodo(at index: Int) -> Todo
}

protocol TodoInteractorToPresenterProtocol {
    func didGetTodos(todos: [Todo])
}

protocol TodoPresenterToViewProtocol {
    func didGetTodos(todos: [Todo])
}

protocol TodoViewToPresenterProtocol {
    func getTodos()
    func didSelectTodo(at index: Int)
}

// MARK: - Detail Todo Protocols

// View -> Presenter
protocol DetailTodoViewToPresenterProtocol: AnyObject {
    var view: DetailTodoPresenterToViewProtocol? { get set }
    var interactor: DetailTodoPresenterToInteractorProtocol? { get set }
    var router: DetailTodoPresenterToRouterProtocol? { get set }
    var todo: Todo? { get set }
    
    func viewDidLoad()
    func updateTodoStatus(isCompleted: Bool)
}

// View <-- Presenter
protocol DetailTodoPresenterToViewProtocol: AnyObject {
    func showTodoDetails(todo: Todo)
    func showUpdateResult(success: Bool)
}

// Presenter --> Interactor
protocol DetailTodoPresenterToInteractorProtocol: AnyObject {
    var presenter: DetailTodoInteractorToPresenterProtocol? { get set }
    var todo: Todo? { get set }
    
    func fetchTodoDetails()
    func saveTodoStatus(isCompleted: Bool)
}

// Preseter <-- Interactor
protocol DetailTodoInteractorToPresenterProtocol: AnyObject {
    func didFetchTodoDetails(todo: Todo)
    func didUpdateTodoStatus(success: Bool)
}

// Presenter to Router
protocol DetailTodoPresenterToRouterProtocol: AnyObject {
    static func createModule(with todo: Todo) -> DetailViewController
}
