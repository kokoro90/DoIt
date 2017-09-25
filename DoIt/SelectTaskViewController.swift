//
//  SelectTaskViewController.swift
//  DoIt
//
//  Created by Daniel Weber on 9/23/17.
//  Copyright © 2017 chi. All rights reserved.
//

import UIKit

class SelectTaskViewController: UIViewController
{
    @IBOutlet weak var selectTaskLabel: UILabel!
    var task = Task()
    var previousVC = TasksViewController()

    override func viewDidLoad()
    {
        super.viewDidLoad()

        selectTaskLabel.text = task.name
    }

    @IBAction func completeTaskButton(_ sender: Any)
    {
        previousVC.tasks.remove(at: previousVC.selectedIndex)
        previousVC.tableView.reloadData()
        navigationController?.popViewController(animated: true)
    }
}
