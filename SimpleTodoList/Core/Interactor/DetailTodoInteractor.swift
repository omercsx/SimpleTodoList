//
//  DetailTodoInteractor.swift
//  SimpleTodoList
//
//  Created by Omer Cagri Sayir on 29.11.2024.
//

class DetailTodoInteractor: DetailTodoPresenterToInteractorProtocol {
    weak var presenter: DetailTodoInteractorToPresenterProtocol?
    var todo: Todo?
    
    func fetchTodoDetails() {
        guard let todo = todo else {
            return
        }
        // Simulate fetching todo details
        presenter?.didFetchTodoDetails(todo: todo)
    }
    
    func saveTodoStatus(isCompleted: Bool) {
        // Simulate saving todo status
        todo?.isCompleted = isCompleted
        // Assume the save success
        presenter?.didUpdateTodoStatus(success: true)
    }
    
    
}
