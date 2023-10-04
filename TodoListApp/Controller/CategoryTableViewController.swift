//
//  CategoryTableViewController.swift
//  TodoListApp
//
//  Created by Taha Turan on 2.10.2023.
//

import UIKit
import RealmSwift

class CategoryTableViewController: UITableViewController {
    //MARK: - Properties
    let realm = try! Realm()
    private var categoryItems: Results<Category>?

    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadCategories()

    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryItems?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.CellId.categoryCell, for: indexPath)
         
       
            
        cell.textLabel?.text = categoryItems?[indexPath.row].name ?? "No categories Added"
        
        
        
        
        return cell
    }
    // MARK: - TableView Delagate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: K.NavgigationId.categoryToItems, sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TodoListViewController
        
        if let indexPath = tableView.indexPathForSelectedRow, let categoryItems = categoryItems {
            destinationVC.selectedCategory = categoryItems[indexPath.row]
        }
    }

 
    //MARK: - Add New Categories
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Category", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Category", style: .default) { _ in
            if let text = textField.text {
                let categoryItem = Category()
                categoryItem.name = text
             
                self.save(category: categoryItem)
                
            }
        }
        
        alert.addTextField { alertTextField in
            alertTextField.placeholder = "Create a new Category"
            textField = alertTextField
        }
        alert.addAction(action)
        present(alert, animated: true)
        
    }
    
    // MARK: - Data Manuplation Methods
    
    func save(category: Category) {
        do {
            try realm.write({
                realm.add(category)
            })
        } catch  {
            print("Error saving context, \(error)")
        }
        tableView.reloadData()
    }
    
    func loadCategories()  {
        categoryItems = realm.objects(Category.self)
        tableView.reloadData()
    }
    
}
