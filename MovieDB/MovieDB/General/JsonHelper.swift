//
//  JsonHelper.swift
//  MovieDB
//
//  Created by Mac User on 5/27/18.
//  Copyright © 2018 Hugo. All rights reserved.
//

import SwiftyJSON



class JsonHelper: NSObject{
    var json: JSON?
    
    init(json: JSON){
        self.json = json
    }
    
    func readStringFromKey(key: String) -> String{
        guard self.json != nil else{return ""}
        
        if let id = self.json![key].string {
            return id
        } else {
            return ""
        }
    } // End of method
    
    func readIntFromKey(key: String) -> Int{
        guard self.json != nil else{return 0}
        
        if let value = self.json![key].int{
            return value
        }else{
            return 0
        }
    }
    
    func readFloatFromKey(key: String) -> CGFloat{
        guard self.json != nil else{return 0.0}
        if let value = json![key].float{
            return CGFloat(value)
        }else{
            return 0.0
        }
    }
    
    func readBoolFromKey(key: String) -> Bool{
        guard self.json != nil else{return false}
        if let value = json![key].bool{
            return value
        }else{
            return false
        }
    }
    
    
} // End of HelperToRead

