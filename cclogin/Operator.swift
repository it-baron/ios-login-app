//
//  Operators.swift
//  2T Client
//
//  Created by alexeus on 04/02/2017.
//  Copyright © 2017 tangotel. All rights reserved.
//

import Foundation

class Operator {
    var id: Int?
    var shortName: String? = ""
    var name: String = ""
    var total: Int = 0
    var online: Int = 0
    
    init(id: Int, shortName: String?, name: String, total: Int, online: Int) {
        self.id = id;
        self.shortName = shortName
        self.name = name;
        self.total = total
        self.online = online
    }
}
