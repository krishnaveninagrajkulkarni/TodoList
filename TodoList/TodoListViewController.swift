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
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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
}

