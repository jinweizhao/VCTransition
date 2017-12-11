//
//  CustomAnimator.swift
//  Demo
//
//  Created by KDB on 2017/12/5.
//  Copyright © 2017年 Will-Z. All rights reserved.
//

import Foundation
import UIKit

class CustomAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        let containerView = transitionContext.containerView
        
        let SCREENWIDTH = UIScreen.main.bounds.width
        let SCREENHEIGHT = UIScreen.main.bounds.height
        
        //fromView
        let fromVC = transitionContext.viewController(forKey: .from)
        let fromView = fromVC?.view
//        fromView?.frame = CGRect(x: 0, y: 0, width: SCREENWIDTH, height: SCREENHEIGHT)
        
        
        //toView
        let toVC = transitionContext.viewController(forKey: .to)
        let toView = toVC?.view
//        toView?.frame = CGRect(x: 0, y: 0, width: SCREENWIDTH, height: SCREENHEIGHT)
        
        let  isPush = true
        
        
//        let isPush = toVC?.navigationController?.viewControllers.count > fromVC?.navigationController?.viewControllers.count
//        if isPush {
//
//        } else {
//
//        }
        
        containerView.addSubview(fromView!)
        containerView.addSubview(toView!)
        toView?.frame = CGRect(x: SCREENWIDTH, y: 0, width: SCREENWIDTH, height: SCREENHEIGHT)
        
        
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {

            if isPush {

                toView?.frame = CGRect(x: 0, y: 0, width: SCREENWIDTH, height: SCREENHEIGHT)

            }

        }) { (complete: Bool) in

            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)

        }
        
        
    }
    
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1
    }
    
    
    
    
}

