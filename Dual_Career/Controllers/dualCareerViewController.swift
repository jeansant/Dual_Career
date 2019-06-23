//
//  ViewController.swift
//  Dual_Career
//
//  Created by Jean Santiuste on 6/3/19.
//  Copyright © 2019 Jean Santiuste. All rights reserved.
//

import UIKit

class dualCareerViewController: UITableViewController {
    
    var itemArray = [Item]()
    
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newItem = Item()
        newItem.title = "Find Mike"
        itemArray.append(newItem)
        
        let newItem2 = Item()
        newItem2.title = "Shake Booty"
        itemArray.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "Do Homework"
        itemArray.append(newItem3)
        
        
        
        if let items = defaults.array(forKey: "DualCareerArray") as? [Item] {
            itemArray = items
        }

    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection
        section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath:
        IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "dualCareerCell",
            for: indexPath)
        
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title
        
        //Ternary operator ==>
        // value = condition ? valueIfTrue : valueIfFalse
        
        cell.accessoryType = item.done ? .checkmark : .none
        
        return cell
        
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        //print(itemArray[indexPath.row])
        
        //tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        tableView.reloadData()
        
        tableView.deselectRow(at: indexPath, animated: true)
  
        //MARK - checkmark functionality
        /*
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }
        else{
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
 */
    }
    
    //MARK - Add new items functionality
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add Career", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Career", style: .default) { (action) in
            // what will happen once the user clicks the add career button on UIAlert
           
            let newitem = Item()
            
            newitem.title = textField.text!
            
            self.itemArray.append(newitem)
            
            self.defaults.set(self.itemArray, forKey: "DualCareerArray")
            
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Add a new career"
            textField = alertTextField
            
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    
}

