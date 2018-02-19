//
//  FeedViewController.swift
//  MakeSenseTest
//
//  Created by Nacho on 17/02/2018.
//  Copyright © 2018 MakeSense. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    @IBOutlet weak var navigationBarView: UIView!
    @IBOutlet weak var navigationTopConstraint: NSLayoutConstraint!    
    @IBOutlet weak var collectionView: UICollectionView!
    
    fileprivate let feedViewPresenter = FeedViewPresenter(feedService: FeedService())
    fileprivate var feed = [Feed]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nibName = UINib(nibName: attributes.specialAddCell.rawValue, bundle:nil)
        collectionView.register(nibName, forCellWithReuseIdentifier: attributes.specialAddCell.rawValue)
        
        let smallCellNib = UINib(nibName: attributes.smallCell.rawValue, bundle:nil)
        collectionView.register(smallCellNib, forCellWithReuseIdentifier: attributes.smallCell.rawValue)
        
        let bannerCellNib = UINib(nibName: attributes.bannerCell.rawValue, bundle:nil)
        collectionView.register(bannerCellNib, forCellWithReuseIdentifier: attributes.bannerCell.rawValue)
        
        let richCellNib = UINib(nibName: attributes.richAddCell.rawValue, bundle:nil)
        collectionView.register(richCellNib, forCellWithReuseIdentifier: attributes.richAddCell.rawValue)

        feedViewPresenter.attachView(self)
        
        do {
            try feedViewPresenter.getFeeds()
        } catch {
            Utils.showErrorWithMsg(Constants.errorLoadUsers, viewController: self)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent        
    }
    
    // Mark: - UICollectionView Datasource & Delegate
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.feed.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        assert(indexPath.row < self.feed.count, "Yikes! Trying to access out-of-bounds array")
        let feed = self.feed[indexPath.row]
        
        if feed.feedType == FeedType.SmallAdd {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: attributes.smallCell.rawValue, for: indexPath) as! SmallCell
            cell.configureCell(feed)
            return cell
        } else if feed.feedType == FeedType.SpecialAdd  {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier:  attributes.specialAddCell.rawValue, for: indexPath) as! SpecialAddCell
            cell.configureCell(feed)
            return cell
            
        } else if feed.feedType == FeedType.RichAdd  {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier:  attributes.richAddCell.rawValue, for: indexPath) as! RichAddCell
            cell.configureCell(feed)
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: attributes.bannerCell.rawValue, for: indexPath) as! BannerCell
            cell.configureCell(feed)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let feed = self.feed[indexPath.row]
        
        if feed.feedType == .SmallAdd {
            return CGSize(width: self.view.frame.size.width/2-NumericConstants.SmallAddAdjustment.rawValue, height: NumericConstants.SmallAddHeight.rawValue);
        } else if feed.feedType == .SpecialAdd {
            return CGSize(width: self.view.frame.size.width-NumericConstants.SpecialAddAdjustment.rawValue, height: self.view.frame.size.width-NumericConstants.SpecialAddAdjustment.rawValue);
        } else if feed.feedType == .BannerAdd {
            return CGSize(width: self.view.frame.size.width, height: NumericConstants.BannerAddHeight.rawValue);
        } else {
            return CGSize(width: self.view.frame.size.width, height: NumericConstants.AddHeight.rawValue);
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let feed = self.feed[indexPath.row] 
    
        if feed.feedType == FeedType.SmallAdd || feed.feedType == FeedType.RichAdd {
            let detailViewController = storyboard?.instantiateViewController(withIdentifier: attributes.DetailViewController.rawValue) as! DetailViewController
            detailViewController.feed = feed
            navigationController?.pushViewController(detailViewController, animated: false)
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if shouldShowHeaderView(scrollView){
            showFloatingHeaderView()
        } else {
            hideFloatingHeaderView()
        }        
    }
    
    
    // MARK: NavigationBar & Animations

    func shouldShowHeaderView(_ scrollView: UIScrollView) -> Bool {
        if (scrollView.contentOffset.y < NumericConstants.ScrollViewBreakThrough.rawValue) {
            return true
        }
        return false
    }

    
    func showFloatingHeaderView() {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut , animations: {
            var navigationBarTopContraint = self.navigationTopConstraint.constant
            navigationBarTopContraint += 10
            self.navigationTopConstraint.constant = min(navigationBarTopContraint,-self.navigationBarView.frame.size.height/3)
            self.view.layoutIfNeeded()            
        })
        
    }
    
    func hideFloatingHeaderView() {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut , animations: {
            var navigationBarTopContraint = self.navigationTopConstraint.constant
            navigationBarTopContraint -= 10
            self.navigationTopConstraint.constant = max(navigationBarTopContraint,-self.navigationBarView.frame.size.height)
            self.view.layoutIfNeeded()
        })
    }
}

extension FeedViewController: UserView {
    func setFeed(_ feeds: [Feed]) {
        self.feed = feeds
    }
}


