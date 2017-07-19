//
//  signUpViewController.swift
//  LetsEat
//
//  Created by Shawn Miller on 7/19/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseDatabase

class signUpViewController: UIViewController {
    
    @IBOutlet weak var userNameFIeld: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func signUpButtonTapped(_ sender: Any) {
        print("sign up Pressed")
        guard let email = emailField.text, let password = passwordField.text, let name = userNameFIeld.text else {
            print("form is not valid")
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password, completion: {(user: User?, error) in
            if error != nil {
                print(error!)
                return
            }
            // succesfully authenticared user
            
            
            let ref = Database.database().reference(fromURL: "https://lets-eat-3d728.firebaseio.com/")
           // values that will be stored in database
            let values = ["name": name, "email": email]
            ref.updateChildValues(values, withCompletionBlock: {
            (err,ref) in
                
                if err != nil{
                    print(err!)
                    return
                }
                
                
                print("saved user succesfully into firebase database")
                
            })
            
        }
            )
        
    
}
}

