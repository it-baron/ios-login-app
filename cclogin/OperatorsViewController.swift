//
//  OperatorsViewController.swift
//  2T Client
//
//  Created by alexeus on 03/02/2017.
//  Copyright © 2017 tangotel. All rights reserved.
//

import Foundation
import UIKit

class OperatorsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    var refreshControl:UIRefreshControl!
    var operatorsStore = OperatorStore()
    
    func loadItems() {
        self.refreshControl.beginRefreshing()
        
        self.operatorsStore.fetchOperatorsItems {
            (operatorsArr) -> Void in
            
            self.operatorsStore.items = operatorsArr
            
            self.refreshControl.endRefreshing()
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.refreshControl = UIRefreshControl()
        self.refreshControl.addTarget(self,
                                      action: #selector(self.refresh(sender:)),
                                      for: .valueChanged)
        
        if #available(iOS 10.0, *) {
            self.tableView.refreshControl = refreshControl
        } else {
            self.tableView.addSubview(refreshControl)
        }
        
        self.tableView.delegate = self.operatorsStore
        self.tableView.dataSource = self.operatorsStore
        self.loadItems()
    }
    
    func refresh(sender:AnyObject) {
        self.loadItems()
    }
}
