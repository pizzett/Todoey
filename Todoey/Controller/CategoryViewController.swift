//
//  CategoryViewController.swift
//  Todoey
//
//  Created by Paul Izzett on 3/9/18.
//  Copyright © 2018 Paul Izzett. All rights reserved.
//

import UIKit
import RealmSwift

class CategoryViewController: UITableViewController {

    let realm = try! Realm()
    
    var categoryArray: Results<Category>?
    
    override func viewDidLoad() {
        super.viewDidLoad()

// CategoryCell
        
        loadCategories()
        
       //MARK: - TableView Datasource methods
        
        
        
        //MARK: - Data manipulation methods
        
        
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        
        cell.textLabel?.text = categoryArray?[indexPath.row].name ?? "No Categories added yet"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return categoryArray?.count ?? 1
    }
    

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
    
    var textField = UITextField()
    
    let alert = UIAlertController(title: "Add new category", message: "", preferredStyle: .alert)
    let action = UIAlertAction(title: "Add category", style: .default) { (action) in
        // what will happen once the user clicks add item
        
        let newCategory = Category()
        newCategory.name = textField.text!
        
        self.save(category: newCategory)
        
    }
    
    alert.addTextField { (alertTextField) in
    alertTextField.placeholder = "Create new category"
    print(alertTextField.text)
    textField = alertTextField
    }
    
    alert.addAction(action)
    
    //show the alert
    present(alert, animated: true, completion: nil)
    }
    
    
    func save(category: Category) {
        
        do {
            try realm.write {
                realm.add(category)
            }
        } catch {
            print("Error saving context \(error)")
        }
        
        tableView.reloadData()
    }
    
    func loadCategories() {
        
        categoryArray = realm.objects(Category.self)

        tableView.reloadData()

    }
    
    //MARK: - TableView Delegate methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItems", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TodoListViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedCategory = categoryArray?[indexPath.row]
        }
    }
    
    
    
}
