//
//  FeedService.swift
//  MakeSenseTest
//
//  Created by Nacho on 17/02/2018.
//  Copyright © 2018 MakeSense. All rights reserved.
//

import UIKit

class FeedService: NSObject {
    
    func getFeeds(completionHandler completion: @escaping (ResultFeed?,NSError?) -> Void) throws -> Void {
        
        do {
            NetworkService.getFeedRequest(getFeedUrl:Urls.getFeedUrl.rawValue) { (json, error) in
                if (json != nil) {
                    let responseFeed = ResultFeed.create(json: json!)
                    completion(responseFeed, nil)
                }
                else {
                    completion(nil, error)
                }
            }
            //let result = try MockNetworkService.getFeed()
            
        }catch{
            print("Error retrieving feeds")
            throw error
        }        
    }

}
