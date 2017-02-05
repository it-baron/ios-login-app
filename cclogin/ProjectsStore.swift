//
//  ProjectsDataSource.swift
//  2T Client
//
//  Created by alexeus on 03/02/2017.
//  Copyright © 2017 tangotel. All rights reserved.
//

import UIKit

class ProjectsStore: NSObject, UITableViewDelegate, UITableViewDataSource {
    var items: [Project] = []
    let session = URLSession.shared
    
    func fetchProjectsItems(completion: @escaping ([Project]) -> Void) {
        let request = CCApi.projectsRequest()
        let task = session.dataTask(with: request) {
            (data, response, error) -> Void in
            
            if error != nil {
                print("error=\(error)")
                return
                
            } else {
                if let httpResponse = response as? HTTPURLResponse {
                    if(httpResponse.statusCode != 200) {
                        print("statusCode should be 200, but is \(httpResponse.statusCode)")
                        print("response = \(response)")
                        return
                        
                    } else {
                        do {
                            print("ok, response = \(response)")
                            
                            let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [String:Any]
                            var fetchedItems: [Project] = [];
                            
                            if let projArray = json?["items"] as? [Any] {
                                for proj in projArray {
                                    if let projItem = proj as? [String:Any] {
                                        fetchedItems.append(
                                            Project(id: projItem["id"] as! Int,
                                                    shortName: projItem["short_name"] as? String,
                                                    name: projItem["name"] as! String)
                                        )
                                    }
                                }
                            }
                            
                            DispatchQueue.main.async(execute: {
                                completion(fetchedItems)
                            })
                            
                        } catch let error as NSError {
                            print(error)
                        }
                    }
                }
            }
        }
        
        task.resume();
    }
    
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
