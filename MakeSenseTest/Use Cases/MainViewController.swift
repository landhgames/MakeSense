//
//  ViewController.swift
//  MakeSenseTest
//
//  Created by Nacho on 16/02/2018.
//  Copyright © 2018 MakeSense. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var duracelImg:          UIImageView!
    @IBOutlet weak var duracelLogoImg:      UIImageView!
    @IBOutlet weak var thePowerImg:         UIImageView!
    @IBOutlet weak var toForgetImage:       UIImageView!
    @IBOutlet weak var getStartedButton:    UIButton!
    @IBOutlet weak var logInButton:         UIButton!
    @IBOutlet weak var alreadyHaveAccount:  UILabel!
    
    // MARK: View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        startAnimation()
        startDuracelTitleAnimation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func setupUI(){
        self.duracelLogoImg.alpha =     0
        self.thePowerImg.alpha =        0
        self.toForgetImage.alpha =      0
        self.getStartedButton.alpha =   0
        self.logInButton.alpha =        0
        self.alreadyHaveAccount.alpha = 0
        self.duracelImg.center = self.view.center
        self.thePowerImg.center.y -=    15
        self.toForgetImage.center.y -= 15
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    // MARK: Animations
    
    func startAnimation() {
        UIView.animate(withDuration: 0.7, delay: 0.75, options: .curveEaseOut , animations: {
            self.duracelImg.center.y -= self.view.bounds.width
            self.duracelImg.alpha = 0
        })
    }
    
    func startDuracelTitleAnimation(){
        UIView.animate(withDuration: 0.7, delay: 1.0, options: .curveEaseOut , animations: {
            var duracelLogoAlpha = self.duracelLogoImg.alpha
            duracelLogoAlpha = 1
            self.duracelLogoImg.alpha = duracelLogoAlpha
            
        }, completion: { finished in
          self.startDuracelTitlePositionAnimation()
        })
    }
    
    func startDuracelTitlePositionAnimation(){
        UIView.animate(withDuration: 1.5, delay: 1.0, options: .curveEaseOut , animations: {
            self.duracelLogoImg.frame.origin.x = 0
            self.duracelLogoImg.frame.origin.y = 50
            self.duracelLogoImg.transform = CGAffineTransform(scaleX: 0.66, y: 0.66)
        }, completion: { finished in
            self.startMessageAnimation()
        })
    }
    
    func startMessageAnimation(){
        UIView.animate(withDuration: 0.35, delay: 0, options: .curveEaseOut , animations: {
            self.thePowerImg.center.y +=    15
            self.toForgetImage.center.y +=  15
            self.thePowerImg.alpha =        1
            self.toForgetImage.alpha =      1
        }, completion: { finished in
            self.showButtonAndLabels()
        })
    }
    
    func showButtonAndLabels(){
        UIView.animate(withDuration: 0.7, delay: 0, options: .curveEaseOut , animations: {
        self.getStartedButton.alpha =    1
        self.alreadyHaveAccount.alpha =  1
        self.logInButton.alpha =         1
        })
    }
}

