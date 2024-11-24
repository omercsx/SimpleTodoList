//
//  LoginPresenter.swift
//  SimpleTodoList
//
//  Created by Mostafa Gamal on 2024-11-23.
//

import UIKit


enum LoginResult {
    case success
    case fail(String)
}

protocol LoginPresenterViewDelegateProtocol: AnyObject {
    func attemptLoginResult(result: LoginResult)
}

protocol LoginPresenterProtocol: PresenterManaging {
    var delegate: LoginPresenterViewDelegateProtocol? {get set}
    func login(email: String, password: String)
}

class LoginPresenter: LoginPresenterProtocol {
    
    weak var delegate: LoginPresenterViewDelegateProtocol?
    
    func getViewController() -> UIViewController {
        return AuthViewController(presenter: self)
    }
    
    private let router: MainRouterProtocol
    
    init(router: MainRouterProtocol) {
        self.router = router
    }
    
    var users: [User] = [
        User(name: "Omer C. Sayir", email: "omer@example.com", password: "1234"),
        User(name: "Mostafa Gamal", email: "mos@example.com", password: "1234"),
        User(name: "John Doe", email: "john@example.com", password: "1111"),
    ]

    func login(email: String, password: String) {
        for user in users where user.email == email.lowercased() && user.password == password {
            UserDefaults.standard.set(user.email, forKey: K.UserDefaults.email)
            UserDefaults.standard.set(user.name, forKey: K.UserDefaults.name)
            router.loginSuccess()
            return
        }
        
        delegate?.attemptLoginResult(result: .fail("Incorrect Username/Password"))
    }

    func logout() {
        //TODO:
//        UserDefaults.standard.removeObject(forKey: K.UserDefaults.email)
//        UserDefaults.standard.removeObject(forKey: K.UserDefaults.name)
    }

    func currentUser() {
        //TODO:
//        guard let email = UserDefaults.standard.string(forKey: K.UserDefaults.email),
//              let name = UserDefaults.standard.string(forKey: K.UserDefaults.name) else {
//            return nil
//        }
//        return User(name: name, email: email, password: "")
    }
}
