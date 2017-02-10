//
//  ViewController.swift
//  cclogin
//
//  Created by alexeus on 07/11/16.
//  Copyright © 2016 tangotel. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var txtLogin: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    // This constraint ties an element at zero points from the bottom layout guide
    @IBOutlet var keyboardHeightLayoutConstraint: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtLogin.resignFirstResponder()
        txtPassword.resignFirstResponder()
        
        txtLogin?.returnKeyType = UIReturnKeyType.done
        txtLogin?.delegate = self
        
        txtPassword?.returnKeyType = UIReturnKeyType.done
        txtPassword?.delegate = self
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.keyboardWillShow(sender:)),
                                               name: NSNotification.Name.UIKeyboardWillShow,
                                               object: nil);
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.keyboardWillHide(sender:)),
                                               name: NSNotification.Name.UIKeyboardWillHide,
                                               object: nil);
    }
    
    func keyboardWillShow(sender: NSNotification) {
        if let userInfo = sender.userInfo {
            let keyboardSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
            let keyboardHeight = (keyboardSize?.height)!
            let buttonBottom = loginButton.frame.height + loginButton.frame.origin.y
            let viewHeight = self.view.frame.height
            
            if viewHeight - keyboardHeight < buttonBottom {
                self.view.frame.origin.y = (viewHeight - keyboardHeight) - (buttonBottom + 16)
            }
        
        }
    }
    
    func keyboardWillHide(sender: NSNotification) {
        self.view.frame.origin.y = 0
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        onLogin(textField)
        return true
    }
    
    func alert(message: String) {
        let alert = UIAlertController(title: "Ошибка", message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Закрыть", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    @IBAction func onNavigate(_ sender: Any) {
        self.performSegue(withIdentifier: "ShowAppView", sender: nil);
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
        
        let req = "https://mstat.2t.ru/cc/index.php?option=mod_api&version=1.0&api_module=engine&action=check_auth&username=\(txtLogin.text!)&password=\(txtPassword.text!)";
        
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
                            CCApi.login = self.txtLogin.text!
                            self.performSegue(withIdentifier: "ShowAppView", sender: nil)
                        }
                    }
                }
            }
            }.resume()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "ShowWebView") {
            let req = "https://mstat.2t.ru/cc/index.php?option=login&username=\(txtLogin.text!)&password=\(txtPassword.text!)";
            
            // Get the new view controller using segue.destinationViewController.
            // Pass the selected object to the new view controller.
            let webView = segue.destination as! WebViewController
            webView.urlToOpen = req;
        }
    }
}

