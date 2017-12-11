//
//  SwipeUpInteractiveTransition.swift
//  Demo
//
//  Created by KDB on 2017/12/6.
//  Copyright © 2017年 Will-Z. All rights reserved.
//

import UIKit

class SwipeUpInteractiveTransition: UIPercentDrivenInteractiveTransition {
    
    var interacting = false
    
    var shouldComplete = false
    
    var presentingVC: UIViewController?
    
    
    func wireToViewController(vc: UIViewController) {
        
        self.presentingVC = vc
        
        self.prepareGestureRecognizerInView(view: vc.view)
        
    }
    
    func prepareGestureRecognizerInView(view: UIView) {
        
        let gesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(gesture:)))
        
        view.addGestureRecognizer(gesture)
        
        
    }
    
    func completeSpeed() -> CGFloat {
        return 1.0 - self.percentComplete
    }
    
    @objc func handlePanGesture(gesture: UIPanGestureRecognizer) {
        
        let translation = gesture.translation(in: gesture.view?.superview)
        
        switch gesture.state {
        case .began:
            self.interacting = true
            self.presentingVC?.dismiss(animated: true, completion: nil)
        case .changed:
            var fraction = Float(translation.y / 400.0)
            fraction = fminf(fmaxf(fraction, 0.0), 1.0)
            self.shouldComplete = fraction > 0.5
            self.update(CGFloat(fraction))
        case .cancelled:
            self.interacting = false
            if !self.shouldComplete || gesture.state == .cancelled {
                self.cancel()
            }else {
                self.finish()
            }
        default:
            break
        }
        
        
        
    }
    
    
    
}
