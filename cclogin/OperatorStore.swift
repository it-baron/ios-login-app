//
//  OperatorsDataSource.swift
//  2T Client
//
//  Created by alexeus on 04/02/2017.
//  Copyright © 2017 tangotel. All rights reserved.
//

import UIKit

class OperatorStore: NSObject, UITableViewDelegate, UITableViewDataSource {
    var items: [Operator] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OperatorCell")! as UITableViewCell
        
        cell.textLabel?.text = items[indexPath.row].shortName;
        cell.detailTextLabel?.text = items[indexPath.row].name;
        
        return cell;
    }
}
