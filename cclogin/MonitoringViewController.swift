//
//  MonitoringViewController.swift
//  2T Client
//
//  Created by alexeus on 03/02/2017.
//  Copyright © 2017 tangotel. All rights reserved.
//

import UIKit

class MonitoringViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var refreshControl:UIRefreshControl!
    var monitoringStore = MonitoringStore()
    
    func loadItems() {
        self.refreshControl.beginRefreshing()
        
        monitoringStore.fetchMonitoringItems {
            (monitoringArr) -> Void in
            
            self.monitoringStore.items = monitoringArr
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
        
        self.tableView.delegate = self.monitoringStore
        self.tableView.dataSource = self.monitoringStore
        self.loadItems()
    }
    
    func refresh(sender:AnyObject) {
        self.loadItems()
    }
}
