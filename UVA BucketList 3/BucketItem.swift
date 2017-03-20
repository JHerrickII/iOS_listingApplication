//
//  BucketItem.swift
//  UVA BucketList 3
//
//  Created by John Herrick on 2/17/17.
//  Copyright © 2017 John Herrick. All rights reserved.
//

import Foundation
import UIKit

class BucketItem: NSObject{
    
    var text: String
    var latitude: String
    var longitude: String
    var describe: String
    var dateComp: NSDate
    //var convertedString: String
    var completed: Bool
    
    init(text: String, latitude: String, longitude: String, describe: String, dateComp: NSDate) {
        self.text = text
        self.latitude = latitude
        self.longitude = longitude
        self.describe = describe
        //self.convertedString = convertedString
        self.dateComp = dateComp
        self.completed = false
    }
    
    
    
}

