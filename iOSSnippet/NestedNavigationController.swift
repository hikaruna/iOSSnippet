//
//  NestedNavigationController.swift
//  iOSSnippet
//
//  Created by hikaru on 2015/11/04.
//  Copyright © 2015年 hikaruna.net. All rights reserved.
//

import UIKit

// 親に更にNavCが存在している時、自身のNavItemを親にForwardして、親のNavBarとして振舞っているように見せることが出来るNavC
// ParentNavC-(root)->ContainerView-(embed)->NestedNavigationController-(root)->Item1VC というように配置するとき
// ParentNavCのNavBarのItemをItem1VCのNavItemに出来る
class NestedNavigationController: UINavigationController {
    override func viewDidLoad() {
        self.delegate = self
    }
}

extension NestedNavigationController: UINavigationControllerDelegate {
    func navigationController(navigationController: UINavigationController, didShowViewController viewController: UIViewController, animated: Bool) {
        self.navigationController?.navigationBar.setItems([(self.viewControllers.last?.navigationItem)!], animated: true)
    }
}
