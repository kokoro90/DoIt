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
    var task: Task? = nil

    override func viewDidLoad()
    {
        super.viewDidLoad()

        selectTaskLabel.text = (task!.isImportant ? "❗️" : "") + task!.name!
    }

    @IBAction func completeTaskButton(_ sender: Any)
    {
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let context = delegate.persistentContainer.viewContext

        context.delete(task!)
        delegate.saveContext()

        navigationController?.popViewController(animated: true)
    }
}
