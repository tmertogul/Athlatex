//
//  Events.swift
//  SlugLife
//
//  Created by Daniel Urrutia on 10/8/15.
//  Copyright © 2015 Tim Mertogul. All rights reserved.
//

import Foundation
import UIKit

struct events {
    var date: String?
    var location: String?
    var title: String?
    var college: String?
    
    
    
    init(date:String?, location: String?, title:String?, college : String?){
        self.date = date
        self.location = location
        self.title = title
        self.college = college 
    }
}


