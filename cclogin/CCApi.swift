//
//  CCApi.swift
//  2T Client
//
//  Created by alexeus on 05/02/2017.
//  Copyright © 2017 tangotel. All rights reserved.
//

import Foundation

struct LocalApiStrings {
    static let baseURLString = "http://localhost:3000/";
    static let projectsURLString = "proj";
    static let operatorsURLString = "ops";
    static let monitoringURLString = "mon";
    static let accountURLString = "account";
}

struct CCApiStrings {
    static let baseURLString = "https://mstat.2t.ru/mob/";
    static let projectsURLString = "index.php?action=get_projects_json";
    static let operatorsURLString = "index.php?action=get_ops_json";
    static let monitoringURLString = "index.php?action=get_mon_json";
    static let accountURLString = "index.php?action=get_acc_json";
}

struct CCApi {
    static let login: String = "demoapp";
    static let password: String = "";
    
    static func accountRequest() -> URLRequest {
        let myUrl = URL(string: "\(LocalApiStrings.accountURLString)&login=\(login)",
            relativeTo: URL(string: LocalApiStrings.baseURLString))
        
        var request = URLRequest(url: myUrl!)
        request.httpMethod = "GET";
        return request;
    }
    
    static func projectsRequest() -> URLRequest {
        let myUrl = URL(string: "\(LocalApiStrings.projectsURLString)&login=\(login)",
                        relativeTo: URL(string: LocalApiStrings.baseURLString))
        
        var request = URLRequest(url: myUrl!)
        request.httpMethod = "GET";
        return request;
    }
    
}
