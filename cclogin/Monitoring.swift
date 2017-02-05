//
//  Monitoring.swift
//  2T Client
//
//  Created by alexeus on 04/02/2017.
//  Copyright © 2017 tangotel. All rights reserved.
//

import Foundation

class Monitoring {
    var id: String?
    var shortName: String = ""
    var name: String = ""
    var total: Int = 0
    var accepted: Int = 0
    
    init(id:String, shortName: String, name:String, total:Int, accepted:Int) {
        self.id = id
        self.shortName = shortName
        self.name = name
        self.total = total
        self.accepted = accepted
    }
}
