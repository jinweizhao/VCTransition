//
//  ViewController.swift
//  Demo
//
//  Created by KDB on 2017/11/29.
//  Copyright © 2017年 Will-Z. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIViewControllerTransitioningDelegate,ModalControllerDelegate,UINavigationControllerDelegate {

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
        
        self.transitioningDelegate = self;

        
    }
    
    
    @IBAction func nextClick(_ sender: Any) {
        
        let vc = ModalController()
        
        vc.delegate = self
        
        self.present(vc, animated: true, completion: nil)
        
    }
    
    
    
    
    //present 的动画
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return CustomTransition.transitionWith(transitionType: .TransitionTypePresent)
    }
    
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return CustomTransition.transitionWith(transitionType: .TransitionTypeDismiss)
    }
    
    //执行 present 的时候的手势
    func interactionControllerForPresentation(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interactivePresent
    }
    
    
    func interactiveTransitionPresented() -> InteractiveTransition? {
        return interactivePresent
    }
    


}

