//
//  CompleteToDoViewController.swift
//  ToDoList
//
//  Created by Eric Smith on 7/5/19.
//  Copyright © 2019 Eric Smith. All rights reserved.
//

import UIKit

class CompleteToDoViewController: UIViewController {
// iteration 1
    var previousVC = ToDoListTableViewController()
    //var selectedToDo = ToDo()
// iteration 2
    var selectedToDo : ToDoCD?
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // titleLabel.text = selectedToDo.name
        titleLabel.text = selectedToDo?.name
        // Do any additional setup after loading the view.
    }
    
    @IBAction func completeTapped(_ sender: Any) {
        // iteration 2
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let theToDo = selectedToDo {
               context.delete(theToDo)
                navigationController?.popViewController(animated: true)
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
