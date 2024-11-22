//
//  HomeViewController.swift
//  SimpleTodoList
//
//  Created by Omer Cagri Sayir on 20.11.2024.
//

import UIKit

class HomeViewController: UIViewController {
    var user: User!

    // MARK: - Properties

    private let usernameLabel = UILabel()
    private let viewModel = TodoViewModel()
    private let userViewModel = AuthViewModel()
    private let tableView = UITableView()
    private let addButton = UIButton(type: .system)

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setupTableView()
        setupAddButton()
        setupNavigationBar()

        // Delete the back button
        navigationItem.hidesBackButton = true
    }

    private func setupNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .done, target: self, action: #selector(logoutButtonTapped))
    }

    @objc func logoutButtonTapped() {
        userViewModel.logout()
        navigationController?.popToRootViewController(animated: true)
    }

    private func setupUI() {
        view.backgroundColor = .systemBackground

        view.addSubview(usernameLabel)

        usernameLabel.text = "Welcome back \(user.name)"
        usernameLabel.font = UIFont.systemFont(ofSize: 24)

        usernameLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            usernameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            usernameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),

        ])
    }

    // Add Button
    private func setupAddButton() {
        view.addSubview(addButton)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.setTitle("Add To-Do", for: .normal)

        // Constraints
        NSLayoutConstraint.activate([
            addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            // add button after the last cell
            addButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -64),
        ])
    }

    // Table View
    private func setupTableView() {
        view.addSubview(tableView)

        // Set delegates
        tableView.delegate = self
        tableView.dataSource = self

        // Registering a custom cell I created before
        tableView.register(TodoCell.self, forCellReuseIdentifier: K.TableView.cellIdentifier)

        // Set constraints
        tableView.translatesAutoresizingMaskIntoConstraints = false // TODO: Ask this
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 32),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -96),
        ])
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Getting the selected todo
        let selectedTodo = viewModel.todos[indexPath.row]

        // Initialize DetailViewController
        let detailVC = DetailViewController()

        // Pass the selected todo to DetailViewController
        detailVC.todo = selectedTodo

        // Navigate to DetailVC
        navigationController?.pushViewController(detailVC, animated: true)

        // Deselect the row
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.todos.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: K.TableView.cellIdentifier, for: indexPath) as? TodoCell
        else {
            return UITableViewCell()
        }

        let todo = viewModel.todos[indexPath.row]
        cell.titleLabel.text = todo.title
        cell.statusLabel.text = todo.isCompleted ? "✅" : "❌"

        return cell
    }
}
