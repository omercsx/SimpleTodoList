//
//  AuthViewModel.swift
//  SimpleTodoList
//
//  Created by Omer Cagri Sayir on 22.11.2024.
//

import Foundation

class AuthViewModel {
    var users: [User] = [
        User(name: "Omer C. Sayir", email: "omer@example.com", password: "1234"),
        User(name: "Mostafa Gamal", email: "mos@example.com", password: "1234"),
        User(name: "John Doe", email: "john@example.com", password: "1111"),
    ]

    func login(email: String, password: String) -> Bool {
        for user in users where user.email == email.lowercased() && user.password == password {
            UserDefaults.standard.set(user.email, forKey: K.UserDefaults.email)
            UserDefaults.standard.set(user.name, forKey: K.UserDefaults.name)
            return true
        }
        return false
    }

    func logout() {
        UserDefaults.standard.removeObject(forKey: K.UserDefaults.email)
        UserDefaults.standard.removeObject(forKey: K.UserDefaults.name)
    }

    func currentUser() -> User? {
        guard let email = UserDefaults.standard.string(forKey: K.UserDefaults.email),
              let name = UserDefaults.standard.string(forKey: K.UserDefaults.name) else {
            return nil
        }
        return User(name: name, email: email, password: "")
    }
}
