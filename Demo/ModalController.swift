//
//  ModalController.swift
//  Demo
//
//  Created by KDB on 2017/12/6.
//  Copyright © 2017年 Will-Z. All rights reserved.
//

import UIKit


class ModalController: UIViewController,UIViewControllerTransitioningDelegate {
    
    var delegate: ModalControllerDelegate?
    
    var interactiveDismiss: InteractiveTransition?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let view = UIView.init(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        
        view.backgroundColor = UIColor.red
        
        self.view.addSubview(view)
        
        self.transitioningDelegate = self;
        self.modalPresentationStyle = .custom
        
        interactiveDismiss = InteractiveTransition.init(WithTransitionType: .Dismiss, gestureDirection: .Down)
        
        interactiveDismiss?.addGestureForViewController(vc: self)
        
    }

    @IBAction func dismiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return CustomTransition.transitionWith(transitionType: .TransitionTypePresent)
    }
    
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return CustomTransition.transitionWith(transitionType: .TransitionTypeDismiss)
    }
    
    
    func interactionControllerForPresentation(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return self.delegate?.interactiveTransitionPresented()
    }
    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interactiveDismiss
    }
    
    
    
}

protocol ModalControllerDelegate {
    func interactiveTransitionPresented() -> InteractiveTransition?
}



