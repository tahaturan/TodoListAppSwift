//
//  SwipeTableViewController.swift
//  TodoListApp
//
//  Created by Taha Turan on 5.10.2023.
//

import SwipeCellKit
import UIKit

class SwipeTableViewController: UITableViewController, SwipeTableViewCellDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 70
    }

    // MARK: - TableView Datasource Methods

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.CellId.todoListItemCellId, for: indexPath) as! SwipeTableViewCell
        cell.delegate = self

        return cell
    }
    
    //MARK: - TableView Delagate Methods
    
  

    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
        guard orientation == .right else { return nil }

        let deleteAction = SwipeAction(style: .destructive, title: "Delete") { _, indexPath in

            self.updateModel(at: indexPath)
        }

        // customize the action appearance
        deleteAction.image = UIImage(named: "delete-icon")

        return [deleteAction]
    }

    func tableView(_ tableView: UITableView, editActionsOptionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> SwipeOptions {
        var options = SwipeOptions()
        options.expansionStyle = .destructiveAfterFill

        return options
    }

    func updateModel(at indexPath: IndexPath) {
        // Update our data Model.
    }
}
