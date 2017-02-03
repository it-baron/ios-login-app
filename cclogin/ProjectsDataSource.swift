//
//  ProjectsDataSource.swift
//  2T Client
//
//  Created by alexeus on 03/02/2017.
//  Copyright © 2017 tangotel. All rights reserved.
//

import Foundation
import UIKit

class ProjectsDataSource: NSObject, UITableViewDelegate, UITableViewDataSource {
    var items = [
        Project(
            id:1,
            shortName: "(800) 250-00-00 ББ",
            name: "Детский мир 2016 входящий (800) 250-00-00 ББ"
        ),
        
        Project(
            id:2,
            shortName: "(800) 250-00-00 ГЛ",
            name:"Детский мир 2016 входящий (800) 250-00-00 ГЛ"
        ),
        
        Project(
            id:3,
            shortName: "(800) 250-00-00 ИМ",
            name: "Детский мир 2016 входящий (800) 250-00-00 ИМ"
        ),
        
        Project(
            id:4,
            shortName: "(800) 250-08-90, (800) 250-00-50",
            name: "Иж МТС ШПД продажи (800) 250-08-90, (800) 250-00-50"
        ),
        
        Project(
            id:5,
            shortName: "(800) 250-08-90, (800) 250-00-50",
            name: "Иж МТС ШПД сервис (800) 250-08-90, (800) 250-00-50"
        )
    ];
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProjectCell")! as UITableViewCell
        
        cell.textLabel?.text = items[indexPath.row].shortName;
        cell.detailTextLabel?.text = items[indexPath.row].name;
        return cell;
    }
}
