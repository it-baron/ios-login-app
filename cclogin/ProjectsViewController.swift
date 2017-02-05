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
    
    var refreshControl:UIRefreshControl!
    var projectsStore = ProjectsStore()
    
    func loadProjectsItems() {
        self.refreshControl.beginRefreshing()
        
        self.projectsStore.fetchProjectsItems {
            (projectsArr) -> Void in
            
            self.projectsStore.items = projectsArr
            self.refreshControl.endRefreshing()
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.refreshControl = UIRefreshControl()
        self.refreshControl.attributedTitle = NSAttributedString(string: "Идет обновление...")
        self.refreshControl.addTarget(self,
                                      action: #selector(self.refresh(sender:)),
                                      for: .valueChanged)
        
        if #available(iOS 10.0, *) {
            self.tableView.refreshControl = refreshControl
        } else {
            self.tableView.addSubview(refreshControl)
        }
        
        self.tableView.delegate = self.projectsStore
        self.tableView.dataSource = self.projectsStore
        self.loadProjectsItems()
    }
    
    func refresh(sender:AnyObject) {
        self.loadProjectsItems()
    }

}
