//
//  CCWebView.swift
//  2T Client
//
//  Created by alexeus on 04/02/2017.
//  Copyright © 2017 tangotel. All rights reserved.
//

import UIKit

class CCWebView: UIViewController {
    @IBOutlet weak var webView: UIWebView!
    var urlToOpen: String = "https://mstat.2t.ru/mob/"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let request = URLRequest(url: URL(string: urlToOpen)!)
        webView.loadRequest(request);
    }
}
