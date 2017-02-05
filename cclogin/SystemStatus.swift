//
//  SystemStatus.swift
//  2T Client
//
//  Created by alexeus on 04/02/2017.
//  Copyright © 2017 tangotel. All rights reserved.
//

import Foundation

class SystemStatus {
    var ccCore: Bool
    var ccStat: Bool
    var ftpServer: Bool
    
    init(ccCore:Bool, ccStat:Bool, ftpServer:Bool) {
        self.ccCore = ccCore
        self.ccStat = ccStat
        self.ftpServer = ftpServer
    }
}
