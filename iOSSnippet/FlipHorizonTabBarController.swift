//
//  FlipHorizonTabBarController.swift
//  iOSSnippet
//
//  Created by hikaru on 2015/11/01.
//  Copyright © 2015年 hikaruna.net. All rights reserved.
//

import UIKit

class FlipHorizonTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }
    
}

extension FlipHorizonTabBarController: UITabBarControllerDelegate {
    func tabBarController(tabBarController: UITabBarController, animationControllerForTransitionFromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
    
    override func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem) {
        print("tabbar:, didSelectItem")
    }
}

extension FlipHorizonTabBarController: UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.5
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let fromVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        let toVC   = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        let containerView = transitionContext.containerView()!
        containerView.insertSubview(toVC.view, belowSubview: fromVC.view)
        
        //適当にアニメーション
        UIView.transitionFromView(
            fromVC.view,
            toView: toVC.view,
            duration: 1.0,
            options: .TransitionFlipFromLeft,
            completion: { finished in
                transitionContext.completeTransition(true)
            }
        )
    }
}

