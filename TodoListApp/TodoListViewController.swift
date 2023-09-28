//
//  ViewController.swift
//  TodoListApp
//
//  Created by Taha Turan on 25.09.2023.
//

import UIKit

class TodoListViewController: UITableViewController {
    //MARK: - Properties
    var itemArray:[String] = ["Find Mike", "Buy Egg", "Travel"]
    
    let defaults = UserDefaults.standard
   
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let items = defaults.array(forKey: K.UserDefaultsKey.todoListArray) as? [String] {
            itemArray = items
        }
        
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
    //MARK: - Add New Items
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
       
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todo Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { actiob in
            if let text  = textField.text {
                self.itemArray.append(text)
                self.defaults.setValue(self.itemArray, forKey: K.UserDefaultsKey.todoListArray)
                self.tableView.reloadData()
            }
        }
    
        alert.addTextField { alertTextField in
            alertTextField.placeholder = "Create a new item"
            textField = alertTextField
            
        }
       
        alert.addAction(action)
        
        present(alert, animated: true)
    }
    
}

