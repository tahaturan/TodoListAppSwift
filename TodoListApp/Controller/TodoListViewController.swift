//
//  ViewController.swift
//  TodoListApp
//
//  Created by Taha Turan on 25.09.2023.
//

import CoreData
import UIKit

class TodoListViewController: UITableViewController {
    // MARK: - Properties

    var itemArray: [Item] = []
    var selectedCategory: Category? {
        didSet {
          //  loadItems()
        }
    }

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
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
//            if let text = textField.text, let selectedCategory = self.selectedCategory {
//                let newItem = Item(context: self.context)
//                newItem.title = text
//                newItem.done = false
//                newItem.parentCategory = selectedCategory
//                self.itemArray.append(newItem)
//
//                self.saveItems()
//            }
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
        do {
            try context.save()
        } catch {
            print("Error saving context, \(error)")
        }

        tableView.reloadData()
    }

//    func loadItems(with request: NSFetchRequest<Item> = Item.fetchRequest(), predicate: NSPredicate? = nil) {
//
//        let categoryPredicate = NSPredicate(format: "parentCategory.name MATCHES %@", selectedCategory!.name!)
//
//        if let addtionalPredicate = predicate {
//            request.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [categoryPredicate, addtionalPredicate])
//        }else{
//            request.predicate = categoryPredicate
//        }
//
//        do {
//            itemArray = try context.fetch(request)
//        } catch {
//            print("Error fetching data from context, \(error)")
//        }
//        tableView.reloadData()
//    }
}

//MARK: - Search Bar Methods
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
