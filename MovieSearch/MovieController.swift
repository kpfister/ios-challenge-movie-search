//
//  MovieController.swift
//  MovieSearch
//
//  Created by Karl Pfister on 6/3/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class MovieController {
    
    static let sharedInstance = MovieController()
    
    static let baseURL = NSURL(string: "http://api.themoviedb.org/3/search/movie?api_key=")
    static let apiKey = NSURL(string: "f83783c7c1e09d03fe09770bc9c4bf57")
    
    static func getMovie(movieName: String, movieKey: String, completion: (movie: [Movie]) -> Void) {
        
        guard let unwrappedUrl = self.baseURL else {
            fatalError("URL optional is nil")
        }
        let urlParameters = ["query=": "\(movieName)",
                             "api_key=": "\(movieKey)"]
        
        NetworkController.performRequestForURL(unwrappedUrl, httpMethod: .Get, urlParameters: urlParameters, body: nil)  { (data, error) in
            
            guard let data = data,
                jsonAnyObject = try? NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments),
                jsonDictionary = jsonAnyObject as? [String:AnyObject],
                movieDictionaries = jsonDictionary["movies"] as? [[String:AnyObject]]
                else {
                    completion(movie: [])
                    return
            }
            print(movieDictionaries)
            
            let movies = movieDictionaries.flatMap{Movie(dictionary: $0)}
            completion(movie: movies)
            
            
        }
    }
}