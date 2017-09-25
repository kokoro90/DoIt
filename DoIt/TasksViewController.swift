//
//  ViewController.swift
//  DoIt
//
//  Created by Daniel Weber on 9/22/17.
//  Copyright © 2017 chi. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{

    @IBOutlet weak var tableView: UITableView!

    var tasks: [Task] = []
    var selectedIndex = 0

    override func viewDidLoad()
    {
        super.viewDidLoad()

        tasks = makeTasks()

        tableView.dataSource = self
        tableView.delegate = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return tasks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        cell.textLabel?.text = (task.isImportant ? "❗️" : "") + task.name
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        tableView.deselectRow(at: indexPath, animated: true)
        let task = tasks[indexPath.row]
        selectedIndex = indexPath.row
        performSegue(withIdentifier: "selectTaskSegue", sender: task)
    }

    func makeTasks() -> [Task]
    {
        let task1 = Task()
        task1.name = "Make breakfast"
        task1.isImportant = false
        
        let task2 = Task()
        task2.name = "Send kids to school"
        task2.isImportant = true
        
        let task3 = Task()
        task3.name = "Take nap"
        task3.isImportant = false
        
        return [task1, task2, task3]
    }
    
    @IBAction func addItemTapped(_ sender: Any)
    {
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "addSegue"
        {
            let nextVC = segue.destination as! AddTaskViewController
            nextVC.previousVC = self
        }
        else if segue.identifier == "selectTaskSegue"
        {
            let nextVC = segue.destination as! SelectTaskViewController
            nextVC.task = sender as! Task
            nextVC.previousVC = self
        }
    }
}

