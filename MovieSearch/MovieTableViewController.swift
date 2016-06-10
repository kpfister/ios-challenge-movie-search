//
//  MovieTableViewController.swift
//  MovieSearch
//
//  Created by Karl Pfister on 6/3/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class MovieTableViewController: UITableViewController, UISearchBarDelegate{
    //MARK: - Outlets
    
    var movies: [Movie] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        MovieController.sharedInstance.searchForMoviesWithSearchTerm("Star Wars") { (movies) in
//            self.movies = movies
//            dispatch_async(dispatch_get_main_queue(), { () -> Void in
//                self.tableView.reloadData()
//            })
//        }
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text else {return }
        MovieController.searchForMoviesWithSearchTerm(searchTerm) { (movies) in
            self.movies = movies
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.tableView.reloadData()
            })
        }
        
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return movies.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("movieCell", forIndexPath: indexPath) as? MovieTableViewCell
        

        cell?.updateMovie(movies[indexPath.row])

        return cell ?? UITableViewCell()
    }
}
