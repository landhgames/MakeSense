//
//  FeedService.swift
//  MakeSenseTest
//
//  Created by Nacho on 17/02/2018.
//  Copyright © 2018 MakeSense. All rights reserved.
//

import UIKit

class FeedService: NSObject {
    
    func getFeeds() throws -> [Feed] {

        do {
            let result = try MockNetworkService.getFeed()
            return result
        }catch{
            print("Error retrieving feeds")
            throw error
        }        
    }

}
