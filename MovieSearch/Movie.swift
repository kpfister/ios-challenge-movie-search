//
//  Movie.swift
//  MovieSearch
//
//  Created by Karl Pfister on 6/10/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class Movie {
    
    private let kTitle = "title"
    private let kOverview = "overview"
    private let kPosterPath = "poster_path"
    private let kRating = "vote_average"
    
    let title: String
    let overview: String
    let imageEndPoint: String
    let rating: Float
    
    init(title: String, overview: String, imageEndPoint: String, rating: Float){
        self.title = title
        self.overview = overview
        self.imageEndPoint = imageEndPoint
        self.rating = rating
    }
    
    
    init?(dictionary: [String:AnyObject]) {
       guard let title = dictionary[kTitle] as? String, overview = dictionary[kOverview] as? String, imageEndPoint = dictionary[kPosterPath] as? String, let rating = dictionary[kRating] as? Float else {return nil}
        self.title = title
        self.overview = overview
        self.imageEndPoint = imageEndPoint
        self.rating = rating
        
    }
    
}


