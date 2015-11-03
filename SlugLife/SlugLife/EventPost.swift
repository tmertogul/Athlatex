//
//  Events.swift
//  SlugLife
//
//  Created by Daniel Urrutia on 10/8/15.
//  Copyright © 2015 Tim Mertogul. All rights reserved.
//
//
//  EventPost.swift
//

import Foundation

class EventPost: PFObject , PFSubclassing {
    @NSManaged var nameStr: String!
    @NSManaged var collegeStr: String!
    @NSManaged var dateStr: String!
    @NSManaged var descrip: String!
    //@NSManaged var image: PFFile
    @NSManaged var user: PFUser
    
    class func parseClassName() -> String {
        return "EventPost"
    }
    
    //2
    override class func initialize() {
        var onceToken: dispatch_once_t = 0
        dispatch_once(&onceToken) {
            self.registerSubclass()
        }
    
    

    
}

    //our constructor to allow us to create a separate event post
    init(nameStr: String, collegeStr: String, dateStr: String, descrip: String, user: PFUser) {
        super.init()
        
        self.nameStr = nameStr
        self.collegeStr = collegeStr
        self.dateStr = dateStr
        self.descrip = descrip
        self.user = user
    }
    
    override init() {
        super.init()
    }
    
    
    
    //This is the code to be called when we need to make a query on our wallpost
    override class func query() -> PFQuery? {
        //1
        let query = PFQuery(className: EventPost.parseClassName())
        //2
        query.includeKey("user")
        //3
        query.orderByDescending("createdAt")
        return query
}
}


