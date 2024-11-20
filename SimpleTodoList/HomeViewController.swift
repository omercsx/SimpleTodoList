//
//  HomeViewController.swift
//  SimpleTodoList
//
//  Created by Omer Cagri Sayir on 20.11.2024.
//

import UIKit

class HomeViewController: UIViewController {
    // MARK: - Properties

    private let viewModel = TodoViewModel()
    private let tableView = UITableView()
    private let addButton = UIButton(type: .system)

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    private func setupUI() {
        view.backgroundColor = .systemBackground
    }
}
