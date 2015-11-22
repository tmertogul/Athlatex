//
//  EventTableViewCell.swift
//  SlugLife
//
//  Created by CDuran on 10/29/15.
//  Copyright © 2015 Tim Mertogul. All rights reserved.
//

import Foundation

import UIKit

class EventTableViewCell: PFTableViewCell {
    @IBOutlet  var Event: UILabel!
    @IBOutlet  var college: UILabel!
    @IBOutlet  var datetime: UILabel!
    @IBOutlet  var descrip: UILabel!    
}