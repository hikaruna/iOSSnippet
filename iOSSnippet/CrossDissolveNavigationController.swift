//
//  CrossDissolveNavigationController.swift
//  iOSSnippet
//
//  Created by hikaru on 2015/11/01.
//  Copyright © 2015年 hikaruna.net. All rights reserved.
//

import UIKit

class CrossDissolveNavigationController: UINavigationController {
    
    private static let animation: UIViewAnimationOptions = .TransitionCrossDissolve
    private static let duration: NSTimeInterval = 0.6
    
    override func pushViewController(viewController: UIViewController, animated: Bool) {
        if animated {
            UIView.transitionWithView(
                self.view,
                duration: CrossDissolveNavigationController.duration,
                options: CrossDissolveNavigationController.animation,
                animations: {
                    super.pushViewController(viewController, animated: false)
                },
                completion: nil
            )
        }else {
            super.pushViewController(viewController, animated:false)
        }
    }
    
    override func popViewControllerAnimated(animated: Bool) -> UIViewController? {
        if animated {
            var popViewController: UIViewController?
            self.popWithTransitionAnimations {
                popViewController = super.popViewControllerAnimated(false)
            }
            return popViewController
        }else {
            return super.popViewControllerAnimated(false)
        }
    }
    
    override func popToRootViewControllerAnimated(animated: Bool) -> [UIViewController]? {
        if animated {
            var popViewControllers: [UIViewController]?
            self.popWithTransitionAnimations {
                popViewControllers = super.popToRootViewControllerAnimated(false)
            }
            return popViewControllers
        }else {
            return super.popToRootViewControllerAnimated(false)
        }
    }
    
    override func popToViewController(viewController: UIViewController, animated: Bool) -> [UIViewController]? {
        if animated {
            var popViewControllers: [UIViewController]?
            self.popWithTransitionAnimations {
                popViewControllers = super.popToViewController(viewController, animated: false)
            }
            return popViewControllers
        }else {
            return super.popToViewController(viewController, animated: false)
        }
    }
    
    private func popWithTransitionAnimations(animations: (() -> Void)) {
        UIView.transitionWithView(
            self.view,
            duration: CrossDissolveNavigationController.duration,
            options: CrossDissolveNavigationController.animation,
            animations: animations,
            completion: nil
        )
    }
}
