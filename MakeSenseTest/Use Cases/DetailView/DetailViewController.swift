//
//  DetailViewController.swift
//  MakeSenseTest
//
//  Created by Nacho on 18/02/2018.
//  Copyright © 2018 MakeSense. All rights reserved.
//

import UIKit

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
    
    var feed : Feed?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        startViewAnimation()
        updateUI()
    }
    
    func setupUI() {
        titleLabel.center.y -=          view.bounds.height
        priceLabel.center.y -=          view.bounds.width
        descriptionLabel.center.y -=    view.bounds.width
        addToWishListButton.center.y -= view.bounds.width
        buyOnlinebutton.center.y -=     view.bounds.width
        separatorView.center.y -=       view.bounds.width
        wishListIcon.alpha =            0
        closeButton.alpha =             0
        moreButton.alpha =              0
    }
    
    func updateUI() {
        if let feed = self.feed {
                titleLabel.text = feed.title
                priceLabel.text = feed.price
                itemImage.image = UIImage.init(named: feed.image)        
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
    // MARK: Animations

    func startViewAnimation() {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveLinear , animations: {
            self.titleLabel.center.y -=         self.view.bounds.width
            self.priceLabel.center.y -=         self.view.bounds.width
            self.descriptionLabel.center.y -=   self.view.bounds.width
            self.addToWishListButton.center.y -= self.view.bounds.width
            self.buyOnlinebutton.center.y -=    self.view.bounds.width
            self.separatorView.center.y -=      self.view.bounds.width

            self.closeButton.alpha =  1.0
            self.moreButton.alpha  =  1.0
            
            self.itemImage.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        })
    }
    
    
    // MARK: IBActions
    
    @IBAction func didPressDismissViewController(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: false)
    }
    
    @IBAction func didPressAddToWithList(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn , animations: {
            self.wishListIcon.alpha = 1.0
        })
    }
    
}
