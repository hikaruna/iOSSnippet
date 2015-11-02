//
//  TabItemA.swift
//  iOSSnippet
//
//  Created by hikaru on 2015/11/01.
//  Copyright © 2015年 hikaruna.net. All rights reserved.
//

import UIKit

class TabItemA: UIViewController {
    
    @IBAction func toItemBButtonTapped(sender: AnyObject) {
        self.tabBarController?.selectedIndex = 1
    }
    
    @IBAction func toItemCButtonTapped(sender: AnyObject) {
        self.tabBarController?.selectedIndex = 2
    }
}
