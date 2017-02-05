//
//  Project.swift
//  2T Client
//
//  Created by alexeus on 03/02/2017.
//  Copyright © 2017 tangotel. All rights reserved.
//

import Foundation

class Project {
    var id: Int?
    var shortName: String? = ""
    var name: String = ""
    
    init(id: Int, shortName: String? = "", name: String = "") {
        self.id = id;
        self.shortName = shortName;
        self.name = name;
    }
}
