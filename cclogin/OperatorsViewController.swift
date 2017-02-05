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
    
    var operatorsDataSource = OperatorStore()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self.operatorsDataSource
        tableView.dataSource = self.operatorsDataSource
    }
    
}
