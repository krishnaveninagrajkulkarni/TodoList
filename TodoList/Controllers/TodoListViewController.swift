//
//  ViewController.swift
//  TodoList
//
//  Created by krishnaveni kulkarni on 16/06/18.
//  Copyright © 2018 krishnaveni kulkarni. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
   //dataArray is now array of object of Class Items
    var dataArray =  [Items]()       //["Buy Apples", "Buy Milk", "Pay Bills"]
    
    //Creating our own custom plist in default directory of the App Folder
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("datafilepath is = \(dataFilePath)")
        
        loadItem()
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
        
        cell.messageLabel.text! = dataArray[indexPath.row].itemData
   
        //##2
        let itemName = dataArray[indexPath.row]
        cell.accessoryType =  itemName.itemChecked ? .checkmark : .none  //This is ternary Operator used here
    
        //Instead of defining label on Cell., we write on cell using below statement
        //cell.textLabel?.text! = dataArray[indexPath.row]
        return cell
        
    }

    
    //Mark - Tableview Delegate Method
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        //print(dataArray[indexPath.row])
       
        tableView.deselectRow(at: indexPath, animated: true) //This gives animation when the row is selected, the gray color comes n goes off
        // ##1
        dataArray[indexPath.row].itemChecked = !dataArray[indexPath.row].itemChecked
        saveItem()
        tableView.reloadData()
        
        
    }
    

    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var localTextField = UITextField()
        //Create a Type of Alert with Title
        let alert = UIAlertController(title: "Add New Item", message: "", preferredStyle: .alert)
        //Create a Action for Alert
        let alertAction = UIAlertAction(title: "Add Item", style: .default) { (action) in
        
        print("localtextField=\(localTextField.text!)")
        let newItem = Items()
        newItem.itemData = localTextField.text!
        self.dataArray.append(newItem)
        self.saveItem()
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
  
    //Adding the Items data into Plist - with all the Properties(i.e. itemData n itemChecked) of Items Class
    func saveItem(){
        let encoder = PropertyListEncoder()
        do{
            let data = try encoder.encode(dataArray)
            try data.write(to: dataFilePath!)
        }catch {
            print(error)
        }
        
    }
    //Retrieving the Data from Items.plist
    func loadItem(){
        let decoder = PropertyListDecoder()
        let data = try? Data(contentsOf: dataFilePath!)
        do {
            dataArray = try decoder.decode([Items].self, from: data!)
        }catch{
            print(error)
        }
        
    }
    
}


