//
//  MovieTableViewController.swift
//  MovieSearch
//
//  Created by Karl Pfister on 6/10/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class MovieTableViewController: UITableViewController, UISearchBarDelegate{
    
    var movies = [Movie]()
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text else {return }
        MovieController.fetchMovies(searchTerm, completion: { (movies) in
            self.movies = movies
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.tableView.reloadData()
            })
        })
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return movies.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("movieCell", forIndexPath: indexPath) as? MovieInfoTableViewCell
        
        cell?.updateMovie(movies[indexPath.row])
        
        return cell ?? UITableViewCell()
        
        
    }
}
