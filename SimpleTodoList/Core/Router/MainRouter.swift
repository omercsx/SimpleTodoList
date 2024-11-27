//
//  MainRouter.swift
//  SimpleTodoList
//
//  Created by Mostafa Gamal on 2024-11-23.
//

import UIKit

protocol MainRouterProtocol {
    func start()
    func loginSuccess()
    func logOut()
}

class MainRouter: MainRouterProtocol {
    private let appRoot: UIWindow
    private let navigationController: UINavigationController
    
    init(appRoot: UIWindow) {
        self.appRoot = appRoot
        self.navigationController = UINavigationController()
        self.appRoot.rootViewController = navigationController
        self.appRoot.makeKeyAndVisible()
    }
    
    func start() {
        let presenter = LoginPresenter(router: self)
        let vc = presenter.getViewController()
        navigationController.setViewControllers([vc], animated: false)
    }
    
    func loginSuccess() {
        print("Navigating to Todo screen")
        
        let todoViewController = TodoViewController()
        let interactor = TodoInteractor()
        let presenter = TodoPresenter(view: todoViewController, interactor: interactor, router: self)
        todoViewController.presenter = presenter
        interactor.presenter = presenter
        
        navigationController.pushViewController(todoViewController, animated: true)
    }
    
    func logOut() {
        print("Implement logout")
        navigationController.popToRootViewController(animated: true)
    }
}
