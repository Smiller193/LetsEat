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
import FirebaseAuth

class signUpViewController: UIViewController {
    
    @IBOutlet weak var userNameFIeld: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(signUpViewController.dismissKeyboard))
        
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)

    }
    
    
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func signUpButtonTapped(_ sender: Any) {
        
        if emailField.text == "" {
            let alertController = UIAlertController(title: "Error", message: "Please Enter Your Email and Password", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
            
        }else{
            
            if validateEmail(enteredEmail:emailField.text!) == true {
                Auth.auth().createUser(withEmail: emailField.text!, password: passwordField.text!, completion: { (user: User? , error) in
                    
                    if error == nil {
                        print("You have successfully signed up")
                        
                        guard let firUser = Auth.auth().currentUser,
                            let username = self.userNameFIeld.text,
                            !username.isEmpty else { return }
                        
                        UserService.create(firUser, username: username) { (Users) in
                            guard user != nil else { return }
                            
                            //print("Created new user: \()")
                        }
                        
                        let storyboard = UIStoryboard(name: "Main", bundle: .main)
                        
                        if let initialViewController = storyboard.instantiateInitialViewController() {
                            self.view.window?.rootViewController = initialViewController
                            self.view.window?.makeKeyAndVisible()
                        }
                    }else{
                        let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                        let defaultAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
                        alertController.addAction(defaultAction)
                        self.present(alertController, animated: true, completion: nil)
                        
                    }
                    
                    
                    
                })
                
            }else{
                
                let alertController = UIAlertController(title: "Error", message: "Please Enter A Valid Email", preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
                alertController.addAction(defaultAction)
                present(alertController, animated: true, completion: nil)

                
                
            }
          
            
            
            
            
            
        }
        
    }
    
    
    
    func validateEmail(enteredEmail:String) -> Bool {
        
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: enteredEmail)
        
    }
}

