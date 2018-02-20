//
//  DetailViewController.swift
//  MakeSenseTest
//
//  Created by Nacho on 18/02/2018.
//  Copyright © 2018 MakeSense. All rights reserved.
//

import UIKit
import SDWebImage

class DetailViewController: UIViewController {

    @IBOutlet weak var titleLabel:          UILabel!
    @IBOutlet weak var priceLabel:          UILabel!
    @IBOutlet weak var descriptionLabel:    UILabel!
    @IBOutlet weak var addToWishListButton: UIButton!
    @IBOutlet weak var buyOnlinebutton:     UIButton!
    @IBOutlet weak var separatorView:       UIView!
    @IBOutlet weak var itemImage:           UIImageView!
    @IBOutlet weak var wishListIcon:        UIButton!
    @IBOutlet weak var closeButton:         UIButton!
    @IBOutlet weak var moreButton:          UIButton!
    
    @IBOutlet weak var titleBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var addedWishListBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var buyButtomBottomConstraint: NSLayoutConstraint!
    
    var feed : Feed?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUI(titleBottomPosition: -500, bottomConstraintPosition: -100)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        startViewAnimation(titleBottomPosition: 242, listBottomPosition: 12, scale : 1.5)
    }
    
    func setupUI(titleBottomPosition : CGFloat, bottomConstraintPosition : CGFloat) {
        wishListIcon.alpha = 0
        closeButton.alpha = 0
        moreButton.alpha =  0
        
        titleBottomConstraint.constant = titleBottomPosition
        addedWishListBottomConstraint.constant = bottomConstraintPosition
        buyButtomBottomConstraint.constant = titleBottomPosition
        self.view.layoutIfNeeded()
    }
    
    func updateUI() {
        if let feed = self.feed {
            titleLabel.text = feed.title
            priceLabel.text = feed.price
            
            let activityIndicator = UIActivityIndicatorView.init(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
            activityIndicator.center = itemImage.center
            activityIndicator.hidesWhenStopped = true
            
            itemImage.addSubview(activityIndicator)
            activityIndicator.startAnimating()
            
            itemImage.sd_setImage(with: URL(string: feed.image), completed: { (image: UIImage?, error: Error?, cacheType: SDImageCacheType, imageURL: URL?) in
                activityIndicator.removeFromSuperview()
            })            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
    // MARK: Animations

    func startViewAnimation(titleBottomPosition: CGFloat, listBottomPosition : CGFloat, scale : CGFloat) {
        self.titleBottomConstraint.constant = titleBottomPosition
        self.buyButtomBottomConstraint.constant = titleBottomPosition
        self.addedWishListBottomConstraint.constant = listBottomPosition
        
        UIView.animate(withDuration: 0.4, delay:0, options: .curveLinear , animations: {
            self.view.layoutIfNeeded()
            self.closeButton.alpha =  1.0
            self.moreButton.alpha  =  1.0
            self.itemImage.transform = CGAffineTransform(scaleX: scale, y: scale)
        })
    }
    
    // MARK: IBActions
    
    @IBAction func didPressDismissViewController(_ sender: UIButton) {
        dismiss(animated:true,completion:nil)
    }
    
    @IBAction func didPressAddToWithList(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn , animations: {
            self.wishListIcon.alpha = 1.0
        })
    }
    
}
