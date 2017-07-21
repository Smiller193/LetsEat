//
//  DisplayRestaurantsViewController.swift
//  LetsEat
//
//  Created by Shawn Miller on 7/21/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth
import Alamofire
import SwiftyJSON
import CoreLocation

class DisplayRestaurantsViewController: UIViewController, CLLocationManagerDelegate {
     var manager = CLLocationManager()
    var currentLocation : CLLocation!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // Manager delegate is equal to self
       manager.delegate = self
        // optimizes location accuracy
        manager.desiredAccuracy = kCLLocationAccuracyBest
        //request for using location when user is using app
        manager.requestWhenInUseAuthorization()
        // call a function that updates location when location is updating
        manager.startUpdatingLocation()
        
        manager.startMonitoringSignificantLocationChanges()
        locationAuthStatus()
        // Do any additional setup after loading the view, typically from a nib.
       // print(Location.sharedInstance.latitude)
         // print(Location.sharedInstance.longitude)
        
        let headers = ["X-Access-Token":"f6565a0360167144"]
        let parameters = ["latitude":Location.sharedInstance.latitude,"longitude":Location.sharedInstance.longitude, "method":"pickup","pickup-radius":2] as [String : Any]
        let apiToContact = "https://api.eatstreet.com/publicapi/v1/restaurant/search?"
        
        let request = Alamofire.request(apiToContact, method: .get, parameters: parameters, encoding: URLEncoding.queryString, headers: headers)
        request.validate().responseJSON() { response in
            switch response.result {
            case .success:
                if let value = response.result.value {
                    let json = JSON(value)
                    let allRestaurantData = json["restaurants"].arrayValue
                    // Do what you need to with JSON here!
                    // print(json)
                    print("\n\nlook here\n\n")
                    print(allRestaurantData)
                    // The rest is all boiler plate code you'll use for API requests
                    
                    
                }
            case .failure(let error):
                print(error)
            }
        }

        
    }
    
        func locationAuthStatus(){
           // willg et the current location
            currentLocation = manager.location
            // will get latitude
            Location.sharedInstance.latitude = currentLocation.coordinate.latitude
            // will get longitude
            Location.sharedInstance.longitude = currentLocation.coordinate.longitude
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
