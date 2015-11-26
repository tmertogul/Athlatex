//
//  EventCellTableViewCell.swift
//  SlugLife
//
//  Created by Daniel Urrutia on 10/8/15.
//  Copyright © 2015 Tim Mertogul. All rights reserved.
//

import UIKit

class EventCell: UITableViewCell {
    
    @IBOutlet var gameLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var ratingImageView: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
