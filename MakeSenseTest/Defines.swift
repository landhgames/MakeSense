//
//  Defines.swift
//  MakeSenseTest
//
//  Created by Nacho on 18/02/2018.
//  Copyright © 2018 MakeSense. All rights reserved.
//

import UIKit

class Constants  {
    static let errorLoadUsers =   NSLocalizedString("Something went wrong, could not load users!", comment: "")
    static let errorTitle =       NSLocalizedString("Oops! Somethig is wrong..", comment: "")
    static let ok =               NSLocalizedString("Ok", comment: "")
}

public enum attributes: String {
    case specialAddCell =         "SpecialAddCell"
    case smallCell =              "SmallCell"
    case bannerCell =             "BannerCell"
    case richAddCell =            "RichAddCell"
    case DetailViewController =   "DetailViewController"
}

public enum NumericConstants : Int {
    case ScrollViewBreakThrough =  320
}



public enum FeedType {
    case SpecialAdd    
    case RichAdd
    case BannerAdd
    case SmallAdd
}

protocol UserView: NSObjectProtocol {
    func setFeed(_ feeds: [Feed])
}

protocol CellProtocol {
    func configureCell(_ feed : Feed)
}

