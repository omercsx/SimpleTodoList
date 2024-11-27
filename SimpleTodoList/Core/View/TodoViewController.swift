//
//  TodoViewController.swift
//  SimpleTodoList
//
//  Created by Omer Cagri Sayir on 27.11.2024.
//

import UIKit

class TodoViewController: UIViewController, TodoPresenterToViewProtocol {
    var presenter: TodoViewToPresenterProtocol?

    private let tableView = UITableView()
    private let addButton = UIButton(type: .system)
    private var todos = [Todo]()
    
    func didGetTodos(todos: [Todo]) {
        self.todos = todos
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTableView()

        presenter?.getTodos()
        
        navigationItem.hidesBackButton = true
    }

    private func setupUI() {
        view.backgroundColor = .systemBackground
    }
   
    private func setupTableView() {
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(TodoCell.self, forCellReuseIdentifier: K.TableView.cellIdentifier)

        tableView.translatesAutoresizingMaskIntoConstraints = false // TODO: Ask this
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -96),
        ])
    }
    
}

extension TodoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: K.TableView.cellIdentifier, for: indexPath) as? TodoCell
        else {
            return UITableViewCell()
        }
        
        let todo = todos[indexPath.row]
        cell.titleLabel.text = todo.title
        cell.statusLabel.text = todo.isCompleted ? "✅" : "❌"
        
        return cell
    }
}

extension TodoViewController: UITableViewDelegate {
    
}
