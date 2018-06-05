//
//  ViewController.swift
//  List
//
//  Created by Christopher on 6/4/18.
//  Copyright © 2018 Christopher Joseph. All rights reserved.
//

import UIKit

class ListViewController: UITableViewController {
    
    var itemArray = ["eggs","milk"]
    
let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        

        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let items = defaults.array(forKey: "ListArray") as? [String]{
            itemArray = items}
    }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
        
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(itemArray[indexPath.row])
        
        
        if  ( tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark ) {         tableView.cellForRow(at: indexPath)?.accessoryType = .none} else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark

}
        tableView.deselectRow(at: indexPath, animated: true)}
    
    
    @IBAction func addButtonPressed(_ sender: Any) {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add New Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
        
            self.itemArray.append(textField.text!)
            
            self.defaults.set(self.itemArray, forKey: "ListArray")
            
            self.tableView.reloadData()
            
            //what hpappens when clicked

        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create New Item Here"
            textField = alertTextField
            
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}

