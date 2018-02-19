//
//  FeedViewPresenter.swift
//  MakeSenseTest
//
//  Created by Nacho on 17/02/2018.
//  Copyright © 2018 MakeSense. All rights reserved.
//

import UIKit

class FeedViewPresenter  {

    fileprivate let feedService: FeedService
    weak fileprivate var userView : UserView?
    
    init(feedService:FeedService){
        self.feedService = feedService
    }
    
    func attachView(_ view:UserView){
        userView = view
    }
    
    func detachView() {
        userView = nil
    }
    
    func getFeeds() throws {
        do{
            let feeds = try feedService.getFeeds()
            self.userView?.setFeed(feeds)
        }catch{
            throw error
        }
    }
    
}
