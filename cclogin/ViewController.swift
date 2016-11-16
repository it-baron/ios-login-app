//
//  ViewController.swift
//  cclogin
//
//  Created by alexeus on 07/11/16.
//  Copyright © 2016 tangotel. All rights reserved.
//

import UIKit
import Foundation

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
    
    func alert(message: String) {
        let alert = UIAlertController(title: "Ошибка", message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Закрыть", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    @IBAction func onLogin(_ sender: Any) {
        if (txtLogin.text?.isEmpty)! {
            self.alert(message: "Логин не может быть пустым")
            return;
        }
        
        if (txtPassword.text?.isEmpty)! {
            self.alert(message: "Пароль не может быть пустым")
            return;
        }
        
        let req = "http://stat.cc.2t.ru/cc/index.php?option=mod_api&version=1.0&api_module=engine&action=check_auth&username=\(txtLogin.text!)&password=\(txtPassword.text!)";
        
        var request = URLRequest(url: URL(string: req)!)
        request.httpMethod = "GET";
        let session = URLSession.shared
        
        session.dataTask(with: request) {data, response, error in
            DispatchQueue.main.async {
                if error != nil {
                    //Your HTTP request failed.
                    print("failed")
                    let message = error?.localizedDescription ?? "unknown error"
                    self.alert(message: message)
                } else {
                    //Your HTTP request succeeded
                    if let httpResponse = response as? HTTPURLResponse {
                        if(httpResponse.statusCode >= 400) {
                            let statusCode = "code: \(httpResponse.statusCode)";
                            let responseData = String(data: data!, encoding: String.Encoding.utf8) ?? "no data";
                            self.alert(message: "\(statusCode)\nresponse: \(responseData)")
                        } else {
                            self.performSegue(withIdentifier: "ShowWebView", sender: nil)
                        }
                    }
                }
            }
            }.resume()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let req = "http://stat.cc.2t.ru/cc/index.php?option=login&username=\(txtLogin.text!)&password=\(txtPassword.text!)";
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let webView = segue.destination as! WebViewController
        webView.urlToOpen = req;
    }
}

