//
//  BouncePresentAnimation.swift
//  Demo
//
//  Created by KDB on 2017/12/6.
//  Copyright © 2017年 Will-Z. All rights reserved.
//

import UIKit

class BouncePresentAnimation: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.8
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        let toVC = transitionContext.viewController(forKey: .to)
        
        let SCREENWIDTH = UIScreen.main.bounds.width
        let SCREENHEIGHT = UIScreen.main.bounds.height
        
        let finalFrame = transitionContext.finalFrame(for: toVC!)
        
        toVC?.view.frame = CGRect(x: 0, y: SCREENHEIGHT, width: SCREENWIDTH, height: SCREENHEIGHT)
        
        let containerView = transitionContext.containerView
        
        containerView.addSubview((toVC?.view)!)
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.0, options: .curveLinear, animations: {
            toVC?.view.frame = finalFrame
        }) { (complete: Bool) in
            transitionContext.completeTransition(complete)
        }
        
        
    }
    
    
    
    
    
}
