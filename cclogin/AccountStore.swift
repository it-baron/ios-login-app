//
//  AccountStore.swift
//  2T Client
//
//  Created by alexeus on 05/02/2017.
//  Copyright © 2017 tangotel. All rights reserved.
//

import UIKit

class AccountStore: NSObject {
    let session = URLSession.shared
    
    func fetchAccountStatus(completion: @escaping (AccountStatus) -> Void) {
        let request = CCApi.accountRequest()
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
                            let json = try JSONSerialization.jsonObject(with: data!, options: []) as! [String:Any]
                        
                            let accountStatus = AccountStatus(accountName: json["account_name"] as! String,
                                                 balance: json["balance"] as! Double,
                                                 minutesLeft: json["minutes_left"] as! Int,
                                                 ccCore: json["cc_core"] as! Bool,
                                                 ccStat: json["cc_stat"] as! Bool,
                                                 ftpServer: json["ftp_server"] as! Bool)
                            
                            
                            DispatchQueue.main.async(execute: {
                                completion(accountStatus)
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
}
