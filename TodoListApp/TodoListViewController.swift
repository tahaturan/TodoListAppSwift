//
//  ViewController.swift
//  TodoListApp
//
//  Created by Taha Turan on 25.09.2023.
//

import UIKit

class TodoListViewController: UITableViewController {
    //MARK: - Properties
    let itemArray:[String] = ["Find Mike", "Buy Egg", "Travel"]
   
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    //MARK: - TableView DataSource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.CellId.todoListItemCellId, for: indexPath)
        let item = itemArray[indexPath.row]
        cell.textLabel?.text = item
        return cell
    }
    
    //MARK: - TableView Delagate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //let item = itemArray[indexPath.row]
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }else{
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    

}

