//
//  EventCellTableViewCell.swift
//  SlugLife
//
//  Created by Daniel Urrutia on 10/8/15.
//  Copyright © 2015 Tim Mertogul. All rights reserved.
//

import UIKit

class EventCell: UITableViewCell {
    
    @IBOutlet weak var gameLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ratingImageView: UIImageView!
    
    var event: events! {
        didSet {
            gameLabel.text = event.college
            nameLabel.text = event.date
            //ratingImageView.image = imageForRating(player.rating)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
