//
//  ToDoListTableViewController.swift
//  ToDoList
//
//  Created by Eric Smith on 7/5/19.
//  Copyright © 2019 Eric Smith. All rights reserved.
//

import UIKit

class ToDoListTableViewController: UITableViewController {

    // iteration 1
    //var toDos : [ToDo] = []
    
    //iteration 2
    var toDos : [ToDoCD] = []
    
    func getToDos() {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            
            if let coreDataToDos = try?context.fetch(ToDoCD.fetchRequest()) as? [ToDoCD] {
                toDos = coreDataToDos
                tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
         super.viewDidLoad()
    // iteration 1
   // toDos = createToDos()
        
    //iteration 2
      
    }

    // MARK: - Table view data source

    // iteration 1
/*
    func createToDos() -> [ToDo] {
        
        let swift = ToDo()
        swift.name = "Learn Swift"
        swift.important = true
        
        let dog = ToDo()
        dog.name = "Walk the dog"
        
        return [swift, dog]
    }
*/
   /*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }
   */
    
 // iteration 1
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return toDos.count
    }

// iteration 1
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        let toDo = toDos[indexPath.row]
        
        //iteration 2
        if let name = toDo.name {
            if toDo.important {
            cell.textLabel?.text = "❗️" + name
        } else {
            cell.textLabel?.text = toDo.name
        }
        }
        

        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getToDos()
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let addVC = segue.destination as? AddToDOViewController {
            addVC.previousVC = self
        }
        
        if let completeVC = segue.destination as? CompleteToDoViewController {
         //   if let toDo = sender as? ToDo {
             if let toDo = sender as? ToDoCD {
                completeVC.selectedToDo = toDo
                completeVC.previousVC = self
            }
        }
    }
    
    // iteration 1
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let toDo = toDos[indexPath.row]
        
        performSegue(withIdentifier: "moveToComplete", sender: toDo)
    }


}
