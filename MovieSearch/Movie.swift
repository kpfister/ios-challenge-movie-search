//
//  Movie.swift
//  MovieSearch
//
//  Created by Karl Pfister on 6/3/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation


class Movie {
    
    private let kTitle = "title"
    private let kVoteAverage = "vote_average"
    private let kOverview = "overview"
    private let kImageEndPoint = "poster_path"

    
    
    let title: String
    let voteAverage: Float
    let overview: String
    let imageEndPoint: String // I think this is a string becauase the api has a /jpg address for the image.
    
    init?(dictionary: [String:AnyObject]) {
        guard let title = dictionary[kTitle] as? String,
        voteAverage = dictionary[kVoteAverage] as? Float,
        overview = dictionary[kOverview] as? String,
        imageEndPoint = dictionary[kImageEndPoint] as? String
            else {
                return nil
        }
        self.title = title
        self.voteAverage = voteAverage
        self.overview = overview
        self.imageEndPoint = imageEndPoint
    }
}


/* My Information from API:
"title"
"vote_average"
"overview"
"poster_path"
*/