//
//  CCWebView.swift
//  2T Client
//
//  Created by alexeus on 04/02/2017.
//  Copyright © 2017 tangotel. All rights reserved.
//

import UIKit

class CCWebView: UIViewController, UIWebViewDelegate {
    @IBOutlet weak var webView: UIWebView!
    
    var urlToOpen: String = "https://mstat.2t.ru/mob/"
    var refreshControl: UIRefreshControl = UIRefreshControl()
    
    func getRequest() -> URLRequest {
        return URLRequest(url: URL(string: urlToOpen)!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.loadRequest(self.getRequest());
        
        refreshControl.addTarget(self,
                                 action: #selector(self.refreshWebView(sender:)),
                                 for: UIControlEvents.valueChanged)
        
        webView.scrollView.addSubview(refreshControl)
        webView.delegate = self
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        refreshControl.beginRefreshing()
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        refreshControl.endRefreshing()
    }
    
    func refreshWebView(sender: UIRefreshControl) {
        print("refresh")
        webView.loadRequest(self.getRequest());
    }
}
