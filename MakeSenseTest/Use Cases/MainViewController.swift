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
    
    @IBOutlet weak var duracelImageConstraint: NSLayoutConstraint!
    @IBOutlet weak var duracelSignLeftConstraint: NSLayoutConstraint!
    @IBOutlet weak var duracelSignTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var thePowerSignTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var toForgetSignTopConstraint: NSLayoutConstraint!
    
    // MARK: View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        startAnimation()
        startDuracelTitleAnimation(completion: {
            self.startDuracelTitlePositionAnimation(leftConstraintValue:-5, topConstraintValue: 40, scaleFactor:0.66, completion: {
                self.startMessageAnimation(topContraintPosition:100, bottomContraintPosition:25, completion: {
                    self.showButtonAndLabels(completion: nil)
                })
            })
        })
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
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    // MARK: Animations
    
    func startAnimation() {
        duracelImageConstraint.constant = 0
        UIView.animate(withDuration: 0.7, delay: 0.75, options: .curveLinear , animations: {
            self.view.layoutIfNeeded()
            self.duracelImg.alpha = 0
        })
    }
    
    func startDuracelTitleAnimation(completion: @escaping () -> Void){
        UIView.animate(withDuration: 0.7, delay: 1.0, options: .curveEaseOut , animations: {
            self.view.layoutIfNeeded()
            self.duracelLogoImg.alpha = 1
            
        }, completion: { finished in
        completion()
        })
    }
    
    func startDuracelTitlePositionAnimation(leftConstraintValue: CGFloat, topConstraintValue : CGFloat, scaleFactor : CGFloat, completion: @escaping () -> Void){
        duracelSignLeftConstraint.constant = leftConstraintValue
        duracelSignTopConstraint.constant = topConstraintValue
        UIView.animate(withDuration: 1.5, delay: 1.0, options: .curveEaseOut , animations: {
            self.view.layoutIfNeeded()
            self.duracelLogoImg.transform = CGAffineTransform(scaleX: scaleFactor, y: scaleFactor)
        }, completion: { finished in
            completion()
        })
    }
    
    func startMessageAnimation(topContraintPosition: CGFloat, bottomContraintPosition:CGFloat, completion: @escaping () -> Void){
        thePowerSignTopConstraint.constant = topContraintPosition
        toForgetSignTopConstraint.constant = bottomContraintPosition
        UIView.animate(withDuration: 0.35, delay: 0, options: .curveEaseOut , animations: {
            self.view.layoutIfNeeded()
            self.thePowerImg.alpha = 1
            self.toForgetImage.alpha = 1
        }, completion: { finished in
            completion()
        })
    }
    
    func showButtonAndLabels(completion: (() -> Void)?){
        UIView.animate(withDuration: 0.7, delay: 0, options: .curveEaseOut , animations: {
        self.getStartedButton.alpha =    1
        self.alreadyHaveAccount.alpha =  1
        self.logInButton.alpha =         1
        })
    }
}

