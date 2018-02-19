//
//  SmallCell.swift
//  MakeSenseTest
//
//  Created by Nacho on 18/02/2018.
//  Copyright © 2018 MakeSense. All rights reserved.
//

import UIKit

class SmallCell: UICollectionViewCell {

    @IBOutlet weak var addImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(_ feed : Feed) {
        self.addImage.image = UIImage.init(named: feed.image)
        self.titleLabel.text = feed.title
    }

}
