//
//  ActionsTableViewDataSource.swift
//  timetracker
//
//  Created by Поли Оранж on 14.03.2024.
//

import UIKit

protocol ActionsTableViewDataSource: UITableViewDataSource, UITableViewDelegate {
    func update(with cellCount: Int,
                tableView: UITableView,
                delegate: ActionsTableViewDataSourceDelegate
    )
}
