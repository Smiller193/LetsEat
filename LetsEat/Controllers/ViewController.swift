//
//  ViewController.swift
//  LetsEat
//
//  Created by Shawn Miller on 7/18/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    @IBAction func letsEatButtonTapped(_ sender: Any) {
        print("Button Pressed")
        self.performSegue(withIdentifier: "displayRestaurants", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(LoginViewController.dismissKeyboard))
        
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)
        
        
       // let apiToContact = "https://api.eatstreet.com/publicapi/v1/restaurant/search?latitude=40.718293&longitude=-74.002276&method=pickup&pickup-radius=2"
       // let headers = ["X-Access-Token": "f6565a0360167144"]
        
        
     


       
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
    

}

