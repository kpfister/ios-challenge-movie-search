//
//  MovieInfoTableViewCell.swift
//  MovieSearch
//
//  Created by Karl Pfister on 6/10/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class MovieInfoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var PosterImageView: UIImageView!
    
    @IBOutlet weak var movieTitleLabel: UILabel!
    
    @IBOutlet weak var movieOverviewLabel: UILabel!

    @IBOutlet weak var movieRatingLabel: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
