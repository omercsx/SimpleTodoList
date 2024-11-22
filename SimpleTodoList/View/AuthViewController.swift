//
//  AuthViewController.swift
//  SimpleTodoList
//
//  Created by Omer Cagri Sayir on 22.11.2024.
//

import UIKit

class AuthViewController: UIViewController {
    let viewModel = AuthViewModel()
    let emailTextField = UITextField()
    let passwordTextField = UITextField()
    let loginButton = UIButton(type: .system)
    let emailLabel = UILabel()
    let passwordLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupUI()

        if viewModel.currentUser()?.email != nil {
            let homeVC = HomeViewController()
            homeVC.user = viewModel.currentUser()
            navigationController?.pushViewController(homeVC, animated: true)
        }
    }

    @objc private func loginButtonTapped() {
        guard let email = emailTextField.text, let password = passwordTextField.text else { return }
        let isLoginSuccessful = viewModel.login(email: email, password: password)

        if isLoginSuccessful {
            let homeVC = HomeViewController()
            homeVC.user = viewModel.currentUser()
            navigationController?.pushViewController(homeVC, animated: true)
        } else {
            let alert = UIAlertController(title: "Login Failed", message: "Please check your email and password", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }

    private func setupUI() {
        view.backgroundColor = .white

        title = "Welcome to \(K.appName)"

        emailLabel.text = "Email"
        passwordLabel.text = "Password"

        emailTextField.placeholder = "Enter your E-mail"
        passwordTextField.placeholder = "Enter your Password"
        passwordTextField.isSecureTextEntry = true

        loginButton.setTitle("Login", for: .normal)

        [emailLabel, passwordLabel, emailTextField, passwordTextField, loginButton].forEach { uiView in
            view.addSubview(uiView)
            uiView.translatesAutoresizingMaskIntoConstraints = false
        }

        // Connecting button with action
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)

        NSLayoutConstraint.activate([
            emailLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            emailLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            emailLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),

            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 8),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),

            passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 16),
            passwordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            passwordLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),

            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 8),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),

            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 32),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
}
