//
//  ModalNavigationController.swift
//  iOSSnippet
//
//  Created by hikaru on 2015/11/01.
//  Copyright © 2015年 hikaruna.net. All rights reserved.
//

import UIKit

// アニメーションがVerticalCoverのNavigationController
class ModalNavigationController: UINavigationController {
    
    override func pushViewController(viewController: UIViewController, animated: Bool) {
        if animated {
            let transition = CATransition()
            transition.duration = 0.3
            transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
            transition.type = kCATransitionMoveIn
            transition.subtype = kCATransitionFromTop
            self.view.layer.addAnimation(transition, forKey:nil)
        }
        super.pushViewController(viewController, animated:false)
    }
    
    override func popViewControllerAnimated(animated: Bool) -> UIViewController? {
        prepareForPop(animated)
        return super.popViewControllerAnimated(false)
    }
    
    override func popToViewController(viewController: UIViewController, animated: Bool) -> [UIViewController]? {
        prepareForPop(animated)
        return super.popToViewController(viewController, animated: false)
    }
    
    override func popToRootViewControllerAnimated(animated: Bool) -> [UIViewController]? {
        prepareForPop(animated)
        return super.popToRootViewControllerAnimated(false)
    }
    
    private func prepareForPop(animated: Bool) {
        if animated {
            let transition = CATransition()
            transition.duration = 0.3;
            transition.timingFunction = CAMediaTimingFunction(name:kCAMediaTimingFunctionEaseIn)
            transition.type = kCATransitionReveal;
            transition.subtype = kCATransitionFromBottom;
            self.view.layer.addAnimation(transition, forKey:nil)
        }
    }
}
