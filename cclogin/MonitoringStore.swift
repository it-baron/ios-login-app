//
//  MonitoringDataSource.swift
//  2T Client
//
//  Created by alexeus on 04/02/2017.
//  Copyright © 2017 tangotel. All rights reserved.
//

import UIKit

class MonitoringStore: NSObject, UITableViewDelegate, UITableViewDataSource {
    var items: [Monitoring] = []
    let session = URLSession.shared
    
    func fetchMonitoringItems(completion: @escaping ([Monitoring]) -> Void) {
        let request = CCApi.monitoringRequest()
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
                            
                            let json = try JSONSerialization.jsonObject(with: data!, options: [])
                            var fetchedItems: [Monitoring] = [];
                            
                            if let array = json as? [Any] {
                                for item in array {
                                    if let itemObj = item as? [String:Any] {
                                        fetchedItems.append(
                                            Monitoring(id: itemObj["id"] as! Int,
                                                     shortName: itemObj["short_name"] as? String,
                                                     name: itemObj["name"] as! String,
                                                     total: itemObj["total"] as! Int,
                                                     accepted: itemObj["accepted"] as! Int)
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
        
        task.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MonitoringCell")! as! MonitoringCell
        
        cell.title?.text = items[indexPath.row].shortName
        cell.subTitle?.text = items[indexPath.row].name
        cell.total?.text = "\(items[indexPath.row].total)"
        cell.accepted?.text = "\(items[indexPath.row].accepted)"
        
        return cell;
    }
}
