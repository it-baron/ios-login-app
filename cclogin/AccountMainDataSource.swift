//
//  AccountGeneralDataSource.swift
//  2T Client
//
//  Created by alexeus on 03/02/2017.
//  Copyright © 2017 tangotel. All rights reserved.
//

import Foundation
import UIKit

class AccountMainDataSource: NSObject, UITableViewDelegate, UITableViewDataSource {
    var items = [
        "Учетная запись",
        "Баланс, руб",
        "Остаток оплаченных минут"
    ]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count;
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = items[indexPath.row];
        return cell;
    }
}
