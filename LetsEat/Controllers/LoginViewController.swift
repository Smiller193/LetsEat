//
//  LoginViewController.swift
//  LetsEat
//
//  Created by Shawn Miller on 7/18/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth
import Firebase


class LoginViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
     @IBOutlet weak var createAnAccount: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func signInButtonTapped(_ sender: Any) {
        // will login a user
        print("Button Pressed")
        if emailField.text != "" && passwordField.text != "" {
            
        
        }
    }
    
    @IBAction func createAnAccountButtonTapped(_ sender: Any) {
        print("Create Account Pressed")
        self.performSegue(withIdentifier: "goToSignUp", sender: self)
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
