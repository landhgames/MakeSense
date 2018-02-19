//
//  MockNetworkService.swift
//  MakeSenseTest
//
//  Created by Nacho on 18/02/2018.
//  Copyright © 2018 MakeSense. All rights reserved.
//

import UIKit

class MockNetworkService: NSObject {

    static func getFeed() throws -> [Feed]{
        var rv = [Feed]()
        
        let add = Feed.init(feedType: FeedType.SpecialAdd, title: nil, leftSubtitle: nil, rightSubtitle: nil, image: "coldbrew", description: nil, price:nil)
        
        let banner = Feed.init(feedType: FeedType.BannerAdd, title: "8 Ways to Stay Active This Summer", leftSubtitle: "For the College Juice", rightSubtitle : "8.12.2016", image: "sky", description: nil, price:nil)
        
        let smallAdd1 = Feed.init(feedType: FeedType.SmallAdd, title: "Keyscaper Emblematic iPhone 6 Clear Case", leftSubtitle: nil, rightSubtitle: nil, image: "leftAddImage", description: nil, price:"$ 40")
        
        let smallAdd2 = Feed.init(feedType: FeedType.SmallAdd, title: "Custom Size Small Parlant",  leftSubtitle: nil, rightSubtitle: nil,image: "rightAddImage", description: nil, price:"$ 100")
        
        let richAdd = Feed.init(feedType: FeedType.RichAdd, title: "Diamond Clarity St. Performance Hybrid Bike, 16 Inch.", leftSubtitle: nil, rightSubtitle: nil, image: "bike", description: "This performance hybrid bike blends the best of road and mountain worlds to result in a sleek bike with an upright riding position. Product ships directly from vendor, allow 10 to 14 business days for processing & shipping.", price : "$ 400")
        
        let pasta = Feed.init(feedType: FeedType.BannerAdd, title: "Single Serving Recipies That Will make your Mouth Water", leftSubtitle: "From your College Juice", rightSubtitle : "8.12.2016", image: "pasta", description: nil, price:nil)
        
        let peaches = Feed.init(feedType: FeedType.SpecialAdd, title: nil, leftSubtitle: nil, rightSubtitle: nil, image: "peaches", description: nil, price:nil)
        
        rv.append(add)
        rv.append(banner)
        rv.append(smallAdd1)
        rv.append(smallAdd2)
        rv.append(richAdd)
        rv.append(pasta)
        rv.append(peaches)

        return rv
    }
}
