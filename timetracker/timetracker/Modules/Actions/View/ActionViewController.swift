//
//  ActionViewController.swift
//  timetracker
//
//  Created by Polina Egorova on 14.03.2024.
//

import UIKit

final class ActionViewController: UIViewController {
    
    weak var delegate: TimerViewControllerDelegate?
    
    // MARK: - Private properties
    
    private enum Constants {
        static let cellIdentifier: String = "ActionsTableViewCell"
    }
    private let output: ActionsViewOutput
    private let tableViewDataSource: ActionsTableViewDataSource
    private var tableView: UITableView

    // MARK: - Init

    init(output: ActionsViewOutput,
         tableViewDataSource: ActionsTableViewDataSource
    ) {
        self.output = output
        self.tableViewDataSource = tableViewDataSource
        self.tableView = UITableView().autolayout()
        
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        setUpTableView()
        updateTableView()
    }

    // MARK: - Private functions

    private func setUpUI() {
        view.backgroundColor = .white

        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 16),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    private func setUpTableView() {
        tableView.register(ActionsTableViewCell.self, forCellReuseIdentifier: Constants.cellIdentifier)
        tableView.delegate = tableViewDataSource
        tableView.dataSource = tableViewDataSource
        tableView.separatorColor = .black
    }
    
    private func updateTableView() {
        output.setActions()
    }
}

extension ActionViewController: ActionsViewInput {
    func didGetActions(actions: [ActionModel]) {
        tableViewDataSource.update(
            with: actions,
            tableView: tableView,
            delegate: self
        )
    }
}

extension ActionViewController: ActionsTableViewDataSourceDelegate {
    func getActionWithProject(index: Int) -> ActionProject? {
        return output.actionsWithProjects(index: index)
    }
    
    func setSelectedAction(action: ActionProject?) {
        delegate?.update(action: action)
        self.dismiss(animated: true)
    }
    
    
}
