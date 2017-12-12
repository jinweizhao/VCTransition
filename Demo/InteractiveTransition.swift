//
//  InteractiveTransition.swift
//  Demo
//
//  Created by KDB on 2017/12/7.
//  Copyright © 2017年 Will-Z. All rights reserved.
//

import UIKit


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
    
    
    
    
    
    
}
