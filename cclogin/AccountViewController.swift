//
//  AccountViewController.swift
//  2T Client
//
//  Created by alexeus on 03/02/2017.
//  Copyright © 2017 tangotel. All rights reserved.
//

import Foundation
import UIKit

class AccountViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var store = AccountStore()
    
    @IBOutlet weak var accountName: UILabel!
    @IBOutlet weak var balance: UILabel!
    @IBOutlet weak var minutesLeft: UILabel!
    
    @IBOutlet weak var ccCoreStatus: UIImageView!
    @IBOutlet weak var ccStatSrvStatus: UIImageView!
    @IBOutlet weak var ftpSrvStatus: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        store.fetchAccountStatus {
            (accountStatus) -> Void in
            
            self.accountName.text = accountStatus.accountName
            self.balance.text = "\(accountStatus.balance)"
            self.minutesLeft.text = "\(accountStatus.minutesLeft)"
            
            if accountStatus.ccCore == true {
                self.ccCoreStatus.image = UIImage(named: "quickaction_icon_confirmation")
            } else {
                self.ccCoreStatus.image = UIImage(named: "quickaction_icon_prohibit")
            }
            
            if accountStatus.ccStat == true {
                self.ccStatSrvStatus.image = UIImage(named: "quickaction_icon_confirmation")
            } else {
                self.ccStatSrvStatus.image = UIImage(named: "quickaction_icon_prohibit")
            }
            
            if accountStatus.ftpServer == true {
                self.ftpSrvStatus.image = UIImage(named: "quickaction_icon_confirmation")
            } else {
                self.ftpSrvStatus.image = UIImage(named: "quickaction_icon_prohibit")
            }
        }
    }
}
