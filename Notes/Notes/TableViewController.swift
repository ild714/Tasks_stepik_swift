//
//  TableViewController.swift
//  Notes
//
//  Created by Ильдар Нигметзянов on 07/08/2019.
//  Copyright © 2019 Learning with Swift. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var notes = FileNoteBook()
    
    override func viewDidLoad() {
        //tableView.reloadData()
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .add, target: self, action: #selector(segue))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(del))
       
        title = "Заметки"
        //notes.add(Note(title: "1", content: "2", color: UIColor.red, importance: Importance.general, dateDestraction: nil))
        //notes.saveToFile()
        //if notes.collection?.count == 0 { } else {
        
        //}
        
//        if let amount = notes.collection?.count {
//            if amount == 0 {} else {
//            for _ in 1...amount {
//                control.append(true)
//            }
//            }
//        } else {}
    }

    
    var boolDel = false
    @objc func del() {
        tableView.isEditing = boolDel ? false : true
        boolDel = tableView.isEditing
        
    }
    
    @objc func segue() {
        performSegue(withIdentifier: "edit", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let one = ViewController(notes: notes,detail: nil)
        
        //present(one,animated: true)
        if let view = segue.destination as? ViewController, segue.identifier == "edit" {
        view.notes = one.notes
        //view.textTitle = notes.collection?[0].title
        //view.textTitle = "dd"
        }
    }
    
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return notes.collection!.count
    }

   
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //notes.loadFromFile()
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        //if control[indexPath.row] == true {
        
        cell.cellColor.backgroundColor = notes.collection?[indexPath.row].color
        cell.cellLabel.text = notes.collection?[indexPath.row].title
        cell.cellText.text  = notes.collection?[indexPath.row].content
        //}
        return cell
        
    }
    
    var control = [Bool]()
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        //tableView.reloadData()
        notes.loadFromFile()
    }
 
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //let new = ViewController(notes: notes)
        //new.titleUp.text = notes.collection?[indexPath.row].title
        //new.textTitle = notes.collection?[indexPath.row].title
        //navigationController?.pushViewController(new, animated: true)
        
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "o") as! ViewController
        nextVC.notes = notes
        nextVC.detail = notes.collection?[indexPath.row]
        nextVC.textTitle = notes.collection?[indexPath.row].title
        nextVC.textMain = notes.collection?[indexPath.row].content
        //nextVC.textTitle = notes.collection?[indexPath.row].title
        
        //nextVC. = notes.collection?[indexPath.row].title
        self.navigationController?.pushViewController(nextVC, animated: true)
        //segue()
        //tableView.deselectRow(at:indexPath,animated:false)
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style:.destructive,title:"Delete") {
        (action,sourceView,completionHandler) in
        self.notes.collection?.remove(at: indexPath.row)
        self.notes.saveToFile()
            //self.control.remove(at: indexPath.row)
        self.tableView.deleteRows(at: [indexPath], with: .fade)
        completionHandler(true)
    }
        
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [deleteAction])
        
        return swipeConfiguration
    }
    
    
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 200
//    }
    
}
