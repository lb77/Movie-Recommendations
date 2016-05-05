//
//  FirstViewController.swift
//  Movie Recommendations
//
//  Created by Student on 4/29/16.
//  Copyright © 2016 SHP. All rights reserved.
//

import UIKit
//import WebKit

//Interface to search movies by keyword
class KeySearchViewController: UIViewController, UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate {
    var movieDB: Database!
    var matchedMovies = [Movie]()
    
    @IBOutlet weak var enterTags: UILabel!
    @IBOutlet weak var browseTags: UILabel!
    @IBOutlet weak var addBtn: UIButton!
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    //Search Delegation
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText != "" {
            if let keyList: [String] = searchText.componentsSeparatedByString(",") {
                //Hide labels and bring up a table view if user types something
                tableView.hidden = false
                enterTags.hidden = true
                browseTags.hidden = true
                
                matchedMovies = movieDB.getMoviesWithKeywords(keyList)
                tableView.reloadData()
            }
        } else {
            tableView.hidden = true
            enterTags.hidden = false
            browseTags.hidden = false
        }
    }
    
    //Table Delegation
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return matchedMovies.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .Default, reuseIdentifier: "UITableViewCell")
        cell.textLabel?.text = matchedMovies[indexPath.row].name
        return cell
    }
    
    /*
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.hidden = true
        
        let webView = UIWebView(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height))
        
        let movieTitle = "https://www.imdb.com/find?s=all&q="+matchedMovies[indexPath.row].name
        let movieURL = NSURL(string: movieTitle)
        let movieReq = NSURLRequest(URL: movieURL!)
        
        webView.loadRequest(movieReq)
        
        view.addSubview(webView)
        print("Success")
    }
    */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        
        tableView.hidden = true
        enterTags.hidden = false
        browseTags.hidden = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


