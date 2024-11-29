//
//  DetailTodoPresenter.swift
//  SimpleTodoList
//
//  Created by Omer Cagri Sayir on 29.11.2024.
//

class DetailTodoPresenter: DetailTodoViewToPresenterProtocol {
    weak var view: DetailTodoPresenterToViewProtocol?
    var interactor: DetailTodoPresenterToInteractorProtocol?
    var router: DetailTodoPresenterToRouterProtocol?
    var todo: Todo?
    
    func viewDidLoad() {
        interactor?.fetchTodoDetails()
    }
    
    func updateTodoStatus(isCompleted: Bool) {
        interactor?.saveTodoStatus(isCompleted: isCompleted)
    }
}

extension DetailTodoPresenter: DetailTodoInteractorToPresenterProtocol {
    func didFetchTodoDetails(todo: Todo) {
        self.todo = todo
        view?.showTodoDetails(todo: todo)
    }
    
    func didUpdateTodoStatus(success: Bool) {
        view?.showUpdateResult(success: success)
    }
}
