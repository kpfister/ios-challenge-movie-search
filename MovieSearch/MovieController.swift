//
//  MovieController.swift
//  MovieSearch
//
//  Created by Karl Pfister on 6/3/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import UIKit

class MovieController {
    
    static let sharedInstance = MovieController()
    
    
    static let baseURL = "https://api.themoviedb.org/3"
    static let apiKey =  "1622677c9c625ef4e4e27c015befec5f"
    
    
    static var movieSearchURLString = ""
    
    static func searchForMoviesWithSearchTerm(searchTerm: String, completion: (movies: [Movie]) -> Void){
        
        if let escapedSearchTerm = searchTerm.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet()) {
            movieSearchURLString = baseURL + "/search/movie/"
            movieSearchURLString = movieSearchURLString + "?"
            movieSearchURLString = movieSearchURLString + "api_key=" + apiKey
            movieSearchURLString = movieSearchURLString + "&" + "query=" + escapedSearchTerm
            print(movieSearchURLString)
        }
        
        if let url = NSURL(string: movieSearchURLString) {
            NetworkController.performRequestForURL(url)  { (data, error) in
                
                guard let data = data,
                    jsonAnyObject = try? NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments),
                    jsonDictionary = jsonAnyObject as? [String:AnyObject],
                    movieDictionaries = jsonDictionary["results"] as? [[String:AnyObject]]
                    else {
                        completion(movies: [])
                        return }
                let movies = movieDictionaries.flatMap{Movie(dictionary: $0)}
                print(movies)
                completion(movies: movies)
            }
        }
    }
}








//    static func getMovie(movieName: String, movieKey: String, completion: (movie: [Movie]) -> Void) {
//
//
//        NetworkController.performRequestForURL(url, httpMethod: .Get, body: nil)  { (data, error) in
//
//            guard let data = data,
//                jsonAnyObject = try? NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments),
//                jsonDictionary = jsonAnyObject as? [String:AnyObject],
//                movieDictionaries = jsonDictionary["movies"] as? [[String:AnyObject]]
//                else {
//                    completion(movie: [])
//                    return
//            }
//            print(movieDictionaries)
//
//            let movies = movieDictionaries.flatMap{Movie(dictionary: $0)}
//            completion(movie: movies)
//
//
//        }
//    }


/*var movieSearchURLString = ""
 if let escapedSearchTerm = searchTerm.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet())
 {
 movieSearchURLString = kBaseURLString + "/search/movie/" + "?" + "api_key=" + kAPIKey
 movieSearchURLString = movieSearchURLString + "&" + "query=" + escapedSearchTerm
 }*/