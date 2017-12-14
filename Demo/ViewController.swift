//
//  ViewController.swift
//  Demo
//
//  Created by KDB on 2017/11/29.
//  Copyright © 2017年 Will-Z. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIViewControllerTransitioningDelegate {

    var customTransition: CustomTransition?
    
    var interactivePresent: InteractiveTransition?
    
    @IBOutlet weak var nextBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        interactivePresent = InteractiveTransition.init(WithTransitionType: .Present, gestureDirection: .Up)
        
        interactivePresent?.presentConfig = {() -> Void in
            self.nextClick(self.nextBtn)
        }
        
        interactivePresent?.addGestureForViewController(vc: self)
        
        
    }
    
    
    @IBAction func nextClick(_ sender: Any) {
        
        let vc = ModalController()
        
        vc.transitioningDelegate = self
        
        self.present(vc, animated: true, completion: nil)
        
    }
    
    
    
    
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return CustomTransition.transitionWith(transitionType: .TransitionTypePresent)
    }
    
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return CustomTransition.transitionWith(transitionType: .TransitionTypeDismiss)
    }
    
    
//    func interactionControllerForPresentation(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
//        InteractiveTransition.init(WithTransitionType: .Present, gestureDirection: .Up)
//    }
    

}

