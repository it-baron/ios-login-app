//
//  WebViewController.swift
//  cclogin
//
//  Created by alexeus on 16/11/16.
//  Copyright © 2016 tangotel. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {
    @IBOutlet weak var uiWebView: UIWebView!
    var urlToOpen: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        let request = URLRequest(url: URL(string: urlToOpen)!)
        // Do any additional setup after loading the view.
        uiWebView.loadRequest(request);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func onBackPress(_ sender: Any) {
        if uiWebView.canGoBack {
            uiWebView.goBack()
        }
    }

}
