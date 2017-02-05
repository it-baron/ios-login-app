//
//  AccountStatus.swift
//  2T Client
//
//  Created by alexeus on 04/02/2017.
//  Copyright © 2017 tangotel. All rights reserved.
//

import Foundation

class AccountStatus {
    var accountName: String = ""
    var balance: Double = 0.0
    var minutesLeft: Int = 0
    var ccCore: Bool = false
    var ccStat: Bool = false
    var ftpServer: Bool = false
    
    init(accountName:String, balance:Double, minutesLeft:Int, ccCore:Bool, ccStat:Bool, ftpServer:Bool) {
        self.accountName = accountName
        self.balance = balance
        self.minutesLeft = minutesLeft
        self.ccCore = ccCore
        self.ccStat = ccStat
        self.ftpServer = ftpServer
    }
}
