//
//  DetailViewController.swift
//  SimpleTodoList
//
//  Created by Omer Cagri Sayir on 20.11.2024.
//

import UIKit

class DetailViewController: UIViewController, DetailTodoPresenterToViewProtocol {
    func showTodoDetails(todo: Todo) {
        setupUI(todo: todo)
    }
    
    func showUpdateResult(success: Bool) {
        let message = success ? "Todo updated successfully." : "Failed to update Todo."
        let alert = UIAlertController(title: "Update Status", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
    
    // MARK: - Properties
    var presenter: DetailTodoViewToPresenterProtocol?

    // MARK: - UI Elements

    let titleLabel = UILabel()
    let titleTextField = UITextField()
    let descriptionLabel = UILabel()
    let descriptionTextField = UITextField()
    let isCompletedLabel = UILabel()
    let isCompletedCheckBox = UISwitch()
    let dateTitleLabel = UILabel()
    let dateLabel = UILabel()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.viewDidLoad()
    
    
    }

    // MARK: - Helpers

    private func setupUI(todo: Todo) {
        view.backgroundColor = .systemBackground
//
//        // Create Vertical Stack for title label and titleTextField
        let titleStackView = UIStackView(arrangedSubviews: [titleLabel, titleTextField])
        titleStackView.axis = .vertical
        titleStackView.spacing = 8

        // Create Vertical Stack for description label and descriptionTextField
        let descriptionStackView = UIStackView(arrangedSubviews: [descriptionLabel, descriptionTextField])
        descriptionStackView.axis = .vertical
        descriptionStackView.spacing = 8

        // Create Vertical Stack for isCompleted label and isCompletedCheckBox
        let isCompletedStackView = UIStackView(arrangedSubviews: [isCompletedLabel, isCompletedCheckBox])
        isCompletedStackView.axis = .vertical
        isCompletedStackView.spacing = 8

        // Create Vertical Stack for date label and dateTextField
        let dateStackView = UIStackView(arrangedSubviews: [dateTitleLabel, dateLabel])
        dateStackView.axis = .vertical
        dateStackView.spacing = 8

        // Create Vertical Stack for all subviews
        let allStackView = UIStackView(arrangedSubviews: [
            titleStackView,
            descriptionStackView,
            isCompletedStackView,
            dateStackView,
        ])
        allStackView.axis = .vertical
        allStackView.spacing = 16

        view.addSubview(allStackView)
        // Set constraints
        allStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            allStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            allStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            allStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

        ])

        // Set up text fields
        titleLabel.text = "Title"
        descriptionLabel.text = "Description"
        isCompletedLabel.text = "Progress"
        dateTitleLabel.text = "Creation Date"

        titleLabel.textColor = .gray
        descriptionLabel.textColor = .gray
        isCompletedLabel.textColor = .gray
        dateTitleLabel.textColor = .lightGray

        titleTextField.text = todo.title
        descriptionTextField.text = todo.description
        isCompletedCheckBox.isOn = todo.isCompleted
        dateLabel.text = todo.createdAt.formatted()
    }
}
