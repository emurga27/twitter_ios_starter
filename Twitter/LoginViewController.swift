//
//  LoginViewController.swift
//  Twitter
//
//  Created by Elena on 10/7/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        if UserDefaults.standard.bool(forKey: "userLoggedIn") == true {
            self.performSegue(withIdentifier: "goToNavController", sender: self)
        }
    }
    
    @IBAction func loginButton(_ sender: UIButton) {
        let url = "https://api.twitter.com/oauth/request_token"
        
        TwitterAPICaller.client?.login(url: url, success: {
            //we do this to not log back again
            UserDefaults.standard.set(true, forKey: "userLoggedIn")
            self.performSegue(withIdentifier: "goToNavController", sender: self)
        }, failure: { (Error) in
            print("Error: Could not log in.")
        })
        
    }
}
