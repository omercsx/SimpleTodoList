//
//  DetailTodoRouter.swift
//  SimpleTodoList
//
//  Created by Omer Cagri Sayir on 29.11.2024.
//

import UIKit

class DetailTodoRouter: DetailTodoPresenterToRouterProtocol {
    static func createModule(with todo: Todo) -> DetailViewController {
        let view = DetailViewController()
        let presenter = DetailTodoPresenter()
        let interactor = DetailTodoInteractor()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.todo = todo
        interactor.todo = todo
        
        return view
    }
}
