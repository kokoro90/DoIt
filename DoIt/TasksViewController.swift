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

    override func viewDidLoad()
    {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
    }

    override func viewWillAppear(_ animated: Bool)
    {
        getTasks()
        tableView.reloadData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return tasks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        cell.textLabel?.text = (task.isImportant ? "❗️" : "") + task.name!
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        tableView.deselectRow(at: indexPath, animated: true)
        let task = tasks[indexPath.row]
        performSegue(withIdentifier: "selectTaskSegue", sender: task)
    }


    func getTasks()
    {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let context = delegate.persistentContainer.viewContext

        do
        {
            tasks = try context.fetch(Task.fetchRequest()) as! [Task]
        }
        catch
        {
            print("Caught an exception")
        }
    }

    @IBAction func addItemTapped(_ sender: Any)
    {
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "selectTaskSegue"
        {
            let nextVC = segue.destination as! SelectTaskViewController
            nextVC.task = sender as? Task
        }
    }
}

