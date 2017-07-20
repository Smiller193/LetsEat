//
//  UserService.swift
//  LetsEat
//
//  Created by Shawn Miller on 7/20/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

struct UserService {
    static func create(_ firUser: User, username: String, completion: @escaping (User?) -> Void) {
        let userAttrs = ["username": username,
            "email" : firUser.email
        ]
        
        //let ref = Database.database().reference().child("users").child(firUser.uid)
        let ref = Database.database().reference(fromURL: "https://lets-eat-3d728.firebaseio.com/").child("users").child(firUser.uid)
        ref.setValue(userAttrs) { (error, ref) in
            if let error = error {
                assertionFailure(error.localizedDescription)
                return completion(nil)
            }
            
            print("Saved user successfully into firebase db")
            ref.observeSingleEvent(of: .value, with: { (snapshot) in
                
            })
        }
    }
}
