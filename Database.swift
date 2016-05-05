//
//  Database.swift
//  Movie Recommendations
//
//  Created by Ron on 5/3/16.
//  Copyright © 2016 SHP. All rights reserved.
//

import UIKit

class Database {
    var moviesList = [Movie]()
    
    //Returns a list of movies containing given keywords
    func getMoviesWithKeywords(tagNames: [String]) -> [Movie] {
        var matchingMovies = [Movie]()
        
        for obj in moviesList {
            if obj.keywordsInDesc(tagNames) > 0 {
                matchingMovies.append(obj)
            }
        }
        
        return matchingMovies
    }
}