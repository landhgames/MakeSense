//
//  Feed.swift
//  MakeSenseTest
//
//  Created by Nacho on 18/02/2018.
//  Copyright © 2018 MakeSense. All rights reserved.
//

import UIKit

class Feed  {
    var feedType : FeedType?
    var title : String?
    var leftSubtitle : String?
    var rightSubtitle : String?
    var image : String = ""    
    var description : String?
    var price : String?
    
    var leftAdd : Feed?
    var rightAdd : Feed?
    
    convenience init(feedType: FeedType, title : String?, leftSubtitle : String?, rightSubtitle : String?, image : String, description : String?, price : String?) {
        self.init()
        self.feedType = feedType
        self.title = title
        self.leftSubtitle = leftSubtitle
        self.rightSubtitle = rightSubtitle
        self.image = image
        self.description = description
        self.price = price
    }        
}
