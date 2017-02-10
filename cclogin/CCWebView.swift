//
//  CCWebView.swift
//  2T Client
//
//  Created by alexeus on 04/02/2017.
//  Copyright © 2017 tangotel. All rights reserved.
//

import UIKit

extension UIImage {
    class func imageWithColor(color: UIColor) -> UIImage {
        let rect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 0.5)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        color.setFill()
        UIRectFill(rect)
        let image : UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
}

class CCWebView: UIViewController {
    @IBOutlet weak var webView: UIWebView!
    var urlToOpen: String = "https://mstat.2t.ru/mob/"
    
    func getRequest() -> URLRequest {
        return URLRequest(url: URL(string: urlToOpen)!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let color = UIColor.init(red: 0.5, green: 0, blue: 0.5, alpha: 1);
        
        self.navigationController?.navigationBar.setBackgroundImage(
            UIImage.imageWithColor(color: color), for: .default)
        
        self.navigationController?.navigationBar.shadowImage = UIImage.imageWithColor(color: color)
        
        webView.loadRequest(self.getRequest());
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self,
                                 action: #selector(self.refreshWebView(sender:)),
                                 for: UIControlEvents.valueChanged)
        
        webView.scrollView.addSubview(refreshControl)
    }
    
    func refreshWebView(sender: UIRefreshControl) {
        print("refresh")
        webView.loadRequest(self.getRequest())
        sender.endRefreshing()
    }
}
