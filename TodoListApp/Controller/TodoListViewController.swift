//
//  ViewController.swift
//  TodoListApp
//
//  Created by Taha Turan on 25.09.2023.
//

import UIKit

class TodoListViewController: UITableViewController {
    // MARK: - Properties

    var itemArray: [Item] = []

    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appending(path: "Items.plist")

    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
      
        loadItems()
    }

    // MARK: - TableView DataSource Methods

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.CellId.todoListItemCellId, for: indexPath)
        let item = itemArray[indexPath.row]

        cell.textLabel?.text = item.title
        cell.accessoryType = item.done ? .checkmark : .none
        return cell
    }

    // MARK: - TableView Delagate Methods

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = itemArray[indexPath.row]
        item.done.toggle()
        saveItems()

        tableView.deselectRow(at: indexPath, animated: true)
    }

    // MARK: - Add New Items

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()

        let alert = UIAlertController(title: "Add New Todo Item", message: "", preferredStyle: .alert)

        let action = UIAlertAction(title: "Add Item", style: .default) { _ in
            if let text = textField.text {
                let newItem = Item()
                newItem.title = text
                self.itemArray.append(newItem)

                self.saveItems()
            }
        }

        alert.addTextField { alertTextField in
            alertTextField.placeholder = "Create a new item"
            textField = alertTextField
        }

        alert.addAction(action)

        present(alert, animated: true)
    }

    // MARK: - Model Manuplation Methods

    func saveItems() {
        let encoder = PropertyListEncoder()

        do {
            let data = try encoder.encode(itemArray)
            if let dataFilePath = dataFilePath {
                try data.write(to: dataFilePath)
            }
        } catch {
            print("Error encoding item array, \(error)")
        }

        tableView.reloadData()
    }
    
    func loadItems()  {
        if let dataFilePath = dataFilePath {
            if let data = try? Data(contentsOf: dataFilePath) {
                let decoder = PropertyListDecoder()
                do {
                    itemArray = try decoder.decode([Item].self, from: data)
                } catch  {
                    print("decoder Error, \(error)")
                }
            }
        }
    }
}
