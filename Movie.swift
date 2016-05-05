//
//  Movie.swift
//  Movie Recommendations
//
//  Created by Ron on 5/1/16.
//  Copyright © 2016 SHP. All rights reserved.
//

import UIKit

struct Tag {
    var name: String
    var popularity: Int
}

class Movie {
    var name: String
    var description: String
    var tags = [Tag]()
    
    init(movieName: String, movieDesc: String) {
        name = movieName
        description = movieDesc
    }
    
    //Returns number of keywords contained in a string, to help sort movies
    func keywordsInDesc(keyList: [String]) -> Int {
        var count = 0
        
        for key in keyList {
            if description.lowercaseString.rangeOfString(key) != nil {
                count += 1
            }
        }
        
        return count
    }
    
    //Add a tag
    func addTag(tagName: String) {
        tags.append(Tag(name: tagName, popularity: 0))
    }
    
    //Check if movie has a tag
    func hasTag(tagName: String) -> Bool {
        for obj in tags {
            if obj.name == tagName {
                return true
            }
        }
        return false
    }
    
    //Increases popularity rating of a tag, increasing its search relevancy
    func increasePopularity(searchedTag: String) {
        for var obj in tags {
            if obj.name == searchedTag {
                obj.popularity += 1
                print("+1 search for \(searchedTag)")
                return
            }
        }
        print("\(searchedTag) not found")
    }
}