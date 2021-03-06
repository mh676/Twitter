//
//  LoginViewController.swift
//  Twitter
//
//  Created by Mark Hughes on 2/13/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        
        if UserDefaults.standard.bool(forKey: "userLoggedIn") == true {
            self.performSegue(withIdentifier: "LoginToHome", sender: self)
            
        }
    }
        @IBAction func onLoginButton(_ sender: Any) {
        let myurl = "https://api.twitter.com/oauth/request_token"
        TwitterAPICaller.client?.login(url: myurl, success: {
            self.performSegue(withIdentifier: "LoginToHome", sender: self)
            
            UserDefaults.standard.set(true, forKey: "userLoggedIn")
        }, failure: { (Error) in
            print("Could not Login")
            })
        }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
