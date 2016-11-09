//
//  ViewController.swift
//  cclogin
//
//  Created by alexeus on 07/11/16.
//  Copyright © 2016 tangotel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var txtLogin: UITextField!
    @IBOutlet weak var txtPassword: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onLogin(_ sender: Any) {
        print(txtLogin.text!, txtPassword.text!);
        
        var request = URLRequest(url: URL(string: "http://www.thisismylink.com/postName.php")!);
        request.httpMethod = "POST"
        let postString = "id=13&name=Jack"
    }

}

