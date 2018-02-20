//
//  MakeSenseAnimationTransition.swift
//  MakeSenseTest
//
//  Created by Nacho on 19/02/2018.
//  Copyright © 2018 MakeSense. All rights reserved.
//

import UIKit

class MakeSenseAnimationTransition: NSObject, UIViewControllerAnimatedTransitioning {
    
    let duration = 0.5
    var presenting = true
    var originFrame = CGRect.zero
        
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        let toView = transitionContext.view(forKey: .to)!
        
        containerView.addSubview(toView)
        toView.alpha = 0.0
        UIView.animate(withDuration: duration,
                       animations: {
                        toView.alpha = 1.0
        },completion: { _ in
            transitionContext.completeTransition(true)
        })
    }
}
