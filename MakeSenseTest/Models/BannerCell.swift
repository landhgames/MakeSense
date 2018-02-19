//
//  BannerCell.swift
//  MakeSenseTest
//
//  Created by Nacho on 19/02/2018.
//  Copyright © 2018 MakeSense. All rights reserved.
//

import UIKit

class BannerCell: UICollectionViewCell {

    @IBOutlet weak var addImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()        
    }

    func configureCell(_ feed : Feed) {
        self.addImage.image = UIImage.init(named: feed.image)
    }
}
