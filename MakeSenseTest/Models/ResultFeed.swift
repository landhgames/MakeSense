//
//  MakeSenseResultFeed.swift
//  MakeSenseTest
//
//  Created by Nacho on 19/02/2018.
//  Copyright © 2018 MakeSense. All rights reserved.
//

import UIKit
import SwiftyJSON

class ResultFeed  {
    var feed = [Feed] ()
    
    static func create(json: JSON) -> ResultFeed {
        
        let result = ResultFeed()
        let searchObject = json[attributes.data.rawValue].array
        
        for object in searchObject! {
            let searchResult = Feed.init(json: object)
            result.feed.append(searchResult)
        }
        
        return result
    }
}
