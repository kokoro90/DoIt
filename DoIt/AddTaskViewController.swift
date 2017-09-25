//
//  AddTaskViewController.swift
//  DoIt
//
//  Created by Daniel Weber on 9/22/17.
//  Copyright © 2017 chi. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController
{
    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var importantSwitch: UISwitch!

    @IBAction func addTaskAction(_ sender: Any)
    {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let context = delegate.persistentContainer.viewContext
        let task = Task(context: context)
        task.name = taskNameTextField.text!
        task.isImportant = importantSwitch.isOn
        delegate.saveContext()
        navigationController!.popViewController(animated: true)
    }

    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
}
