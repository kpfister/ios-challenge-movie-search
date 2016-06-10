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
    
    func updateMovie(movie: Movie) {
        movieTitleLabel.text = movie.title
        movieOverviewLabel.text = movie.overview
        movieRatingLabel.text = "Rating: \(movie.rating)"
        let imageURL = "http://image.tmdb.org/t/p/w500" + "\(movie.imageEndPoint)"
        imageController.imageForURL(imageURL, completion: { (image) in
            if let image = image {
                self.PosterImageView.image = image
            }
        })
        
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
