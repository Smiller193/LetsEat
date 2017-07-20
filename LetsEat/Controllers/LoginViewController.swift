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
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(LoginViewController.dismissKeyboard))
        
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)
        
    }
    
    
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    @IBAction func signInButtonTapped(_ sender: Any) {
        // will login a user
        if self.emailField.text == "" || self.passwordField.text == "" {
            let alertController = UIAlertController(title: "Erro", message: "Please enter an email and a a password", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
            
        }else{
            Auth.auth().signIn(withEmail: emailField.text!, password: passwordField.text!, completion: {
        (user, error) in
                if error == nil{
                    // successfully signed in
                    let storyboard = UIStoryboard(name: "Main", bundle: .main)
                    
                    if let initialViewController = storyboard.instantiateInitialViewController() {
                        self.view.window?.rootViewController = initialViewController
                        self.view.window?.makeKeyAndVisible()
                    }else{
                        let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                        let defaultAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
                        alertController.addAction(defaultAction)
                        self.present(alertController, animated: true, completion: nil)


                        
                    }
            
            
            
            
                }
            })
            
        }
    }
    
      
    
    
    @IBAction func createAnAccountButtonTapped(_ sender: Any) {
        print("Button Pressed")
        self.performSegue(withIdentifier: "goToSignUp", sender: self)
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
