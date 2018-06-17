//
//  ViewController.swift
//  TodoList
//
//  Created by krishnaveni kulkarni on 16/06/18.
//  Copyright © 2018 krishnaveni kulkarni. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var dataArray = ["Buy Apples", "Buy Milk", "Pay Bills"]
    //Storing the Data Persistently using UserDefaults
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        //Retrieve the Stored Data from UserDefaults using key "TodoList" and put it in dataArray
        dataArray = defaults.array(forKey: "TodoList") as! [String]
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    //Mark -TableView Datasource Methods

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell =  tableView.dequeueReusableCell(withIdentifier: "Todocell", for: indexPath) as! TodoTableViewCell
        
        cell.messageLabel.text! = dataArray[indexPath.row]
        
        //Instead of defining label on Cell., we write on cell using below statement
        //cell.textLabel?.text! = dataArray[indexPath.row]
        
        return cell
        
    }

    
    //Mark - Tableview Delegate Method
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        print(dataArray[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true) //This gives animation when the row is selected, the gray color comes n goes off
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark{
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }else{
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark  //When the cell is selected , it is marked with Checkmark
        }
    }
    

    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var localTextField = UITextField()
        //Create a Type of Alert with Title
        let alert = UIAlertController(title: "Add New Item", message: "", preferredStyle: .alert)
        //Create a Action for Alert
        let alertAction = UIAlertAction(title: "Add Item", style: .default) { (action) in
        
        print("localtextField=\(localTextField.text!)")
        self.dataArray.append(localTextField.text!)
        self.defaults.set(self.dataArray, forKey: "TodoList")   //store data with Key "TodoList" & value pair in Defaults (Persistance Data)
        self.tableView.reloadData()
        }
        
        alert.addAction(alertAction)  //Add the Action of Alert window
        //Add the textField to Alert Window
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create a New Item"
            localTextField = alertTextField
        }
        
        present(alert, animated: true, completion: nil)
    }
}

