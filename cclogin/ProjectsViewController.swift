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
    
    var projectsDataSource = ProjectsDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = projectsDataSource
        tableView.dataSource = projectsDataSource
    }
}
