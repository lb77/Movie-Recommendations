//
//  FirstViewController.swift
//  Movie Recommendations
//
//  Created by Student on 4/29/16.
//  Copyright © 2016 SHP. All rights reserved.
//

import UIKit

//Search By Keyword
class KeySearchViewController: UIViewController, UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate {
    var movieDB: Database
    var matchedMovies = [Movie]()
    
    @IBOutlet weak var enterTags: UILabel!
    @IBOutlet weak var browseTags: UILabel!
    @IBOutlet weak var addBtn: UIButton!
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    init?(_ coder: NSCoder? = nil, database: Database) {
        movieDB = database
        
        if let coder = coder {
            super.init(coder: coder)
        } else {
            super.init(nibName: nil, bundle: nil)
        }
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        //fatalError("init(coder:) has not been implemented")
        self.init(aDecoder, database: Database())
    }
    
    var searchActive = false
    
    //Begin search delegation functions
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        searchActive = false
    }
    
    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        searchActive = false
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        searchActive = false
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        searchActive = false
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        if let keyList: [String] = searchText.componentsSeparatedByString(",") {
            matchedMovies = movieDB.getMoviesWithKeywords(keyList)
        }
    }
    
    //Begin table delegation functions
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieDB.moviesList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell")! as UITableViewCell
        cell.textLabel?.text = movieDB.moviesList[indexPath.row].name
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        tableView?.delegate = self
        tableView?.dataSource = self
        searchBar?.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


