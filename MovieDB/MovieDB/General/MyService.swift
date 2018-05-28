//
//  MyService.swift
//  MovieDB
//
//  Created by Mac User on 5/27/18.
//  Copyright © 2018 Hugo. All rights reserved.
//


import Foundation
import Alamofire



class MyService{
    
    let headers = [
        "Authorization": "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2NWU1ODkyOGNlNjFjMWExY2Q2MmJmNzZhYmMxZWFhMiIsInN1YiI6IjU4YzllZTIwOTI1MTQxNWRkNjAwMTlhYSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.sQcTtTO2K8krtDU_XPKlcj3qTR_01UsDdbQ-5SKYz4Q",
        "Content-Type": "application/json"
    ]
    
    /* Authenticate and Authorization processes */
    func getMovieList(category: String, callback: @escaping (NSDictionary?)->()){
        
        let parameters = [
            "api_key": "65e58928ce61c1a1cd62bf76abc1eaa2", "sort_by": category
        ]
        
        self.alamofireRequest(url: "https://api.themoviedb.org/3/discover/movie?", method: .get, parameters: parameters, headers: headers, callback: callback)
        
    } // End of signIn
    
   
    
}


extension MyService{
    //Post -- Get -- Patch -- Put -- all methods
    func alamofireRequest(url: String,
                          method: HTTPMethod,
                          parameters: Parameters = [:],
                          headers: HTTPHeaders?,
                          callback: @escaping (NSDictionary?)->()){
        
        Alamofire.request(
            url,
            method: method,
            parameters: parameters,
            headers: headers).responseJSON { (response:DataResponse<Any>) in
                switch (response.result){
                case .success(_):
                    // Htpp Status code: 200 OK!
                        if response.result.value != nil{
                            guard let t: NSDictionary = (response.result.value as? NSDictionary) else {
                                callback(nil)
                                return
                            }
                            //All It's fine!
                            callback(t)
                        }
                case .failure(_):
                    callback(nil)
                }
        }
    }//End alamofire request
}
