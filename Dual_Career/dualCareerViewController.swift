//
//  ViewController.swift
//  Dual_Career
//
//  Created by Jean Santiuste on 6/3/19.
//  Copyright © 2019 Jean Santiuste. All rights reserved.
//

import UIKit

class dualCareerViewController: UITableViewController {
    
    let itemArray = ["Career 1", "Career 2", "Personal"]
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection
        section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath:
        IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "dualCareerCell",
            for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
        
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        //print(itemArray[indexPath.row])
        
        tableView.cellForRow(at: indexPath)?.accessoryType = .disclosureIndicator
        
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
            print("Complete")
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Add a new career"
            textField = alertTextField
            
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    
}

