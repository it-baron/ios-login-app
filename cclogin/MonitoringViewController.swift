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
    
    var monitoringDataSource = MonitoringStore()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self.monitoringDataSource
        tableView.dataSource = self.monitoringDataSource
    }
    
}
