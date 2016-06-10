//
//  MovieContoller.swift
//  MovieSearch
//
//  Created by Karl Pfister on 6/10/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class MovieController {
 
    static let baseURL = "http://api.themoviedb.org/3"
    static let apiKey = "1622677c9c625ef4e4e27c015befec5f"
    static var movieSearchURLString = MovieController.baseURL + "/search/Movie"
    
    static func fetchMovies(searchTerm: String, completion: (movies: [Movie]) -> Void) {
        guard let unwrappedURL = NSURL(string:movieSearchURLString) else {
            completion(movies: [])
            print("No Movies Avaiable")
            return
        }
        
        let urlparameters = ["api_key":"\(apiKey)", "query":"\(searchTerm)"]
        
        NetworkController.performRequestForURL(unwrappedURL, httpMethod: .Get, urlParameters: urlparameters, body: nil) { (data, error) in
            guard let data = data,
            jsonDictionary = (try? NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)) as? [String:AnyObject],
                resultsArray = jsonDictionary["results"] as? [[String:AnyObject]] else { return }
            print(data) // Just to see if anything is coming back
            var movies = [Movie]()
            for resultDictionary in resultsArray {
                if let movie = Movie(dictionary: resultDictionary) {
                    movies.append(movie)
                }
            }
            completion(movies: movies)
            return
        }
    }
}

