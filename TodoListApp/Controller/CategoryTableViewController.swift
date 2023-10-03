//
//  CategoryTableViewController.swift
//  TodoListApp
//
//  Created by Taha Turan on 2.10.2023.
//

import UIKit
import CoreData

class CategoryTableViewController: UITableViewController {
    //MARK: - Properties
    private var categoryItems: [Category] = []
    private let contex = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadCategories()

    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.CellId.categoryCell, for: indexPath)
         
        let categoryItem = categoryItems[indexPath.row]
        
        cell.textLabel?.text = categoryItem.name
        
        return cell
    }
    // MARK: - TableView Delagate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: K.NavgigationId.categoryToItems, sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TodoListViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedCategory = categoryItems[indexPath.row]
        }
    }

 
    //MARK: - Add New Categories
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Category", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Category", style: .default) { _ in
            if let text = textField.text {
                let categoryItem = Category(context: self.contex)
                categoryItem.name = text
                self.categoryItems.append(categoryItem)
                self.saveCategories()
                
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
    
    func saveCategories() {
        do {
            try contex.save()
        } catch  {
            print("Error saving context, \(error)")
        }
        tableView.reloadData()
    }
    
    func loadCategories(request: NSFetchRequest<Category> = Category.fetchRequest())  {
        do {
           categoryItems = try contex.fetch(request)
        } catch  {
            print("Error fetching data from context, \(error)")
        }
        tableView.reloadData()
    }
    
}
