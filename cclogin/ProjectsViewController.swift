//
//  ProjectsViewController.swift
//  2T Client
//
//  Created by alexeus on 03/02/2017.
//  Copyright © 2017 tangotel. All rights reserved.
//

import Foundation
import UIKit

class ProjectsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var projectsStore = ProjectsStore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self.projectsStore
        tableView.dataSource = self.projectsStore
        
        projectsStore.fetchProjectsItems {
            (projectsArr) -> Void in
            
            self.projectsStore.items = projectsArr
            self.tableView.reloadData()
        }
    }
}
