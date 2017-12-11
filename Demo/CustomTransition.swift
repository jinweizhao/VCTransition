//
//  CustomTransition.swift
//  Demo
//
//  Created by KDB on 2017/12/6.
//  Copyright © 2017年 Will-Z. All rights reserved.
//

import UIKit

enum TransitionType: Int {
    case TransitionTypePresent = 0
    case TransitionTypeDismiss
}

class CustomTransition: NSObject, UIViewControllerAnimatedTransitioning {
    
    var transitionType: TransitionType?
    
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        switch transitionType! {
        case .TransitionTypePresent:
            self.presentAnimation(transitionContext: transitionContext)
        case .TransitionTypeDismiss:
            self.dismissAnimation(transitionContext: transitionContext)
        }
        
    }
    
    func presentAnimation(transitionContext: UIViewControllerContextTransitioning) {
        
        let fromVC = transitionContext.viewController(forKey: .from)
        
        let toVC = transitionContext.viewController(forKey: .to)
        
        let tempView = fromVC?.view.snapshotView(afterScreenUpdates: false)
        
        tempView?.frame = (fromVC?.view.frame)!
        
        fromVC?.view.isHidden = true
        
        let containerView = transitionContext.containerView
        
        containerView.addSubview(tempView!)
        containerView.addSubview((toVC?.view)!)
        
        toVC?.view.frame = CGRect(x: 0, y: containerView.bounds.height, width: containerView.bounds.width, height: 400)
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: 0, options: .curveEaseInOut, animations: {
            
            toVC?.view.transform = CGAffineTransform(translationX: 0, y: -400)
            
            tempView?.transform = CGAffineTransform(scaleX: 0.85, y: 0.85)
            
        }) { (complete: Bool) in
            
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            
            if transitionContext.transitionWasCancelled {
                
                fromVC?.view.isHidden = false
                
                tempView?.removeFromSuperview()
                
            }
            
        }
        
        
    }
    
    func dismissAnimation(transitionContext: UIViewControllerContextTransitioning) {
        
        let fromVC = transitionContext.viewController(forKey: .from)
        
        let toVC = transitionContext.viewController(forKey: .to)
        
        let tempView = transitionContext.containerView.subviews[0]
        
        
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: 0, options: .curveEaseInOut, animations: {
            
            fromVC?.view.transform = CGAffineTransform.identity
            tempView.transform = CGAffineTransform.identity
            
        }) { (complete: Bool) in
            
            if transitionContext.transitionWasCancelled {
                transitionContext.completeTransition(false)
            }else {
                
                transitionContext.completeTransition(true)
                
                toVC?.view.isHidden = false
                
                tempView.removeFromSuperview()
                
            }
            
        }
        
        
        
        
    }
    
    
    
    
    
    func initWith(transitionType: TransitionType) -> CustomTransition {
        let transition = CustomTransition()
        transition.transitionType = transitionType
        return transition
    }
    
    class func transitionWith(transitionType: TransitionType) -> CustomTransition {
        let transition = CustomTransition()
        transition.transitionType = transitionType
        return transition
    }
    
    
}
