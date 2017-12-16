//
//  InteractiveTransition.swift
//  Demo
//
//  Created by KDB on 2017/12/7.
//  Copyright © 2017年 Will-Z. All rights reserved.
//

import UIKit

typealias GestureConfig = () ->Void

enum InteractiveDirection: Int {//手势的方向
    case Left
    case Right
    case Up
    case Down
}

enum InteractiveType: Int {//手势控制哪种转场
    case Present
    case Dismiss
    case Push
    case Pop
}


class InteractiveTransition: UIPercentDrivenInteractiveTransition {
    /**记录是否开始手势，判断pop操作是手势触发还是返回键触发*/
    var interaction = false
    
    var presentConfig : GestureConfig?
    
    var pushConfig: GestureConfig?
    
    fileprivate var vc: UIViewController?
    
    fileprivate var interactiveDirection: InteractiveDirection?
    
    fileprivate var interactiveType: InteractiveType?
    
//    class func interactiveTransitionWithTransitionType(type: InteractiveType,gestureDirection direction: InteractiveDirection) {
//
//    }
    
    init(WithTransitionType type: InteractiveType,gestureDirection direction: InteractiveDirection){
        self.interactiveDirection = direction
        self.interactiveType = type
    }
    
    
    
    
    func addGestureForViewController(vc: UIViewController) {
        let pan = UIPanGestureRecognizer.init(target: self, action: #selector(handleGesture(gesture:)))
        
        self.vc = vc
        
        vc.view.addGestureRecognizer(pan)
        
    }
    @objc
    func handleGesture(gesture: UIPanGestureRecognizer) {
        
        var percent: CGFloat = 0.0
        
        switch interactiveDirection! {
        case .Left:
            let transitionX = -gesture.translation(in: gesture.view).x
            percent = transitionX / (gesture.view?.frame.size.width)!
        case .Right:
            let transitionX = gesture.translation(in: gesture.view).x
            percent = transitionX / (gesture.view?.frame.size.width)!
        case .Up:
            let transitionX = -gesture.translation(in: gesture.view).y
            percent = transitionX / (gesture.view?.frame.size.width)!
        case .Down:
            let transitionX = gesture.translation(in: gesture.view).y
            percent = transitionX / (gesture.view?.frame.size.width)!
        }
        
        switch gesture.state {
        case .began:
            //手势开始的时候标记手势状态，并开始相应的事件
            self.interaction = true
            self.startGesture()
        case .changed:
            //手势过程中，通过updateInteractiveTransition设置pop过程进行的百分比
            self.update(percent)
        case .ended:
            //手势完成后结束标记并且判断移动距离是否过半，过则finishInteractiveTransition完成转场操作，否者取消转场操作
            self.interaction = false
            if percent > 0.5 {
                self.finish()
            }else {
                self.cancel()
            }
        default:()
            
        }
    }
    
    func startGesture() {
        
        switch interactiveType! {
        case .Present:
            if self.presentConfig != nil {
                self.presentConfig!()
            }
        case .Dismiss:
            vc?.dismiss(animated: true, completion: nil)
        case .Push:
            if self.pushConfig != nil {
                self.pushConfig!()
            }
        case .Pop:
            vc?.navigationController?.popViewController(animated: true)
        }
        
    }
    
    
}

















