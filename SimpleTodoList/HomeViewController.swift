//
//  HomeViewController.swift
//  SimpleTodoList
//
//  Created by Omer Cagri Sayir on 20.11.2024.
//

import UIKit

class HomeViewController: UIViewController {
    // MARK: - Properties

    private let titleLabel = UILabel()
    private let viewModel = TodoViewModel()
    private let tableView = UITableView()
    private let addButton = UIButton(type: .system)

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setupTableView()
        setupAddButton()
    }

    private func setupUI() {
        view.backgroundColor = .systemBackground

        view.addSubview(titleLabel)

        titleLabel.text = K.appName
        titleLabel.font = UIFont.systemFont(ofSize: 32)

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),

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
            tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 32),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -96),
        ])
    }
}

extension HomeViewController: UITableViewDelegate {
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
