//
//  SmallCell.swift
//  MakeSenseTest
//
//  Created by Nacho on 18/02/2018.
//  Copyright © 2018 MakeSense. All rights reserved.
//

import UIKit
import SDWebImage

class SmallCell: UICollectionViewCell {

    @IBOutlet weak var addImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(_ feed : Feed) {
        let activityIndicator = UIActivityIndicatorView.init(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
        activityIndicator.center = addImage.center
        activityIndicator.hidesWhenStopped = true
        
        addImage.sd_setImage(with: URL(string: feed.image), completed: { (image: UIImage?, error: Error?, cacheType: SDImageCacheType, imageURL: URL?) in
            activityIndicator.removeFromSuperview()
        })
        
        addImage.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        
        self.titleLabel.text = feed.title
    }

}
