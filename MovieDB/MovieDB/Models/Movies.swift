//
//  Movies.swift
//  MovieDB
//
//  Created by Mac User on 5/27/18.
//  Copyright © 2018 Hugo. All rights reserved.
//

import UIKit
import SwiftyJSON

struct Movie{
    var id: Int = 0
    var vote_average: CGFloat = 0.0
    var genre_ids: [Int] = []
    var genre_names: [String] = []
    var original_title : String = ""
    var backdrop_path: String = ""
    var adult: Bool = false
    var popularity: CGFloat = 0.0
    var poster_path: String = ""
    var title: String = ""
    var overview: String = ""
    var orinal_language: String = ""
    var vote_count : Int = 0
    var release_date : String = ""
    var video : Bool = false
    
    init(data: NSDictionary) {
        let jsonHelper = JsonHelper(json: JSON(data))
        self.id = jsonHelper.readIntFromKey(key: "id")
        self.vote_average = jsonHelper.readFloatFromKey(key: "vote_average")
        if let genresAnyArray = jsonHelper.json!["genre_ids"].arrayObject{
            if let genres = genresAnyArray as? [Int]{
                self.genre_ids = genres
            }
            
        }
        self.original_title = jsonHelper.readStringFromKey(key: "original_title")
        self.backdrop_path = jsonHelper.readStringFromKey(key: "backdrop_path")
        self.adult = jsonHelper.readBoolFromKey(key: "adult")
        self.popularity = jsonHelper.readFloatFromKey(key: "popularity")
        self.poster_path = jsonHelper.readStringFromKey(key: "poster_path")
        self.title = jsonHelper.readStringFromKey(key: "title")
        self.overview = jsonHelper.readStringFromKey(key: "overview")
        self.orinal_language = jsonHelper.readStringFromKey(key: "original_language")
        self.vote_count = jsonHelper.readIntFromKey(key: "vote_count")
        self.release_date = jsonHelper.readStringFromKey(key: "release_date")
        self.video = jsonHelper.readBoolFromKey(key: "video")
        
    }
}


struct Movies {
    var total_pages : Int = 0
    var page: Int = 0
    var results: [Movie] = []
    
    init(data: Data){
        let json : JSON = JSON(data)
        let jsonHelper = JsonHelper(json: json)
        self.total_pages = jsonHelper.readIntFromKey(key: "total_pages")
        self.page = jsonHelper.readIntFromKey(key: "1")
        
        
        if let rawMovies = json["results"].arrayObject{
            for element in rawMovies{
                if let data = element as? NSDictionary{
                    self.results.append(Movie(data: data))
                }
            }
        }
        
    }
}

