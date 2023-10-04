//
//  ViewController.swift
//  TodoListApp
//
//  Created by Taha Turan on 25.09.2023.
//

import RealmSwift
import UIKit

class TodoListViewController: UITableViewController {
    // MARK: - Properties

    let realm = try! Realm()
    var todoItems: Results<Item>?
    var selectedCategory: Category? {
        didSet {
            loadItems()
        }
    }

    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - TableView DataSource Methods

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoItems?.count ?? 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.CellId.todoListItemCellId, for: indexPath)
        if let item = todoItems?[indexPath.row] {
            cell.textLabel?.text = item.title
            cell.accessoryType = item.done ? .checkmark : .none
        }

        return cell
    }

    // MARK: - TableView Delagate Methods

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let item = todoItems?[indexPath.row] {
            do {
                try realm.write({
                    item.done.toggle()
                })
            } catch  {
                print("Error Saving Done Status, \(error)")
            }
            tableView.reloadData()
        }

        tableView.deselectRow(at: indexPath, animated: true)
    }

    // MARK: - Add New Items

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()

        let alert = UIAlertController(title: "Add New Todo Item", message: "", preferredStyle: .alert)

        let action = UIAlertAction(title: "Add Item", style: .default) { _ in
            if let text = textField.text, let selectedCategory = self.selectedCategory {
                do {
                    try self.realm.write({
                        let newItem = Item()
                        newItem.title = text
                        selectedCategory.items.append(newItem)
                    })
                } catch {
                    print("Error saving new Items, \(error)")
                }
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

    // MARK: - Model Manuplation Methods

    func loadItems() {
        todoItems = selectedCategory?.items.sorted(byKeyPath: "title", ascending: true)

        tableView.reloadData()
    }
}

// MARK: - Search Bar Methods

extension TodoListViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        let request: NSFetchRequest<Item> = Item.fetchRequest()
//
//
//        if searchText == "" {
//            loadItems()
//            DispatchQueue.main.async {
//                searchBar.resignFirstResponder()
//            }
//        }else{
//
//            let predicate = NSPredicate(format: "title CONTAINS[cd] %@", searchText)
//
//            request.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true)]
//
//            loadItems(with: request, predicate: predicate)
//        }
    }
}
