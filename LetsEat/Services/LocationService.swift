//
//  LocationService.swift
//  LetsEat
//
//  Created by Shawn Miller on 7/21/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import Foundation
import CoreLocation

class Location {
    static var sharedInstance = Location()
    private init(){}
    
    var latitude: Double!
    var longitude: Double!
}
