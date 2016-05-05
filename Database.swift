//
//  Database.swift
//  Movie Recommendations
//
//  Created by Ron on 5/3/16.
//  Copyright © 2016 SHP. All rights reserved.
//

import UIKit

//Main library of movies to search from
class Database {
    var moviesList = [Movie]()
    
    //Basic init, for when there's no real source
    init() {
        let movieNames = ["Captain America", "Iron Man", "The Amazing Spider-Man"]
        let moviePlots = ["Frozen in the ice for decades, Captain America is freed to battle against arch-criminal, The Red Skull.", "After being held captive in an Afghan cave, a billionaire engineer creates a unique weaponized suit of armor to fight evil.", "After Peter Parker is bitten by a genetically altered spider, he gains newfound, spider-like powers and ventures out to solve the mystery of his parent's mysterious death."]
        
        for i in 1..<movieNames.count {
            moviesList.append(Movie(movieName: movieNames[i], movieDesc: moviePlots[i]))
        }
    }
    
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