//
//  UIWindow.swift
//  MSHelper
//
//  Created by Tum on 11/12/15.
//  Copyright © 2015 MoreStudio. All rights reserved.
//

import Foundation

extension UIWindow {
    func visibleViewController()-> UIViewController? {
        return UIWindow.getVisibleViewControllerFrom(self.rootViewController)
    }
    
    class func getVisibleViewControllerFrom(viewController: AnyObject?)-> UIViewController? {
        if let navigation = viewController as? UINavigationController {
            return UIWindow.getVisibleViewControllerFrom(navigation.visibleViewController)
        } else if let tabbar = viewController as?  UITabBarController {
            return UIWindow.getVisibleViewControllerFrom(tabbar.selectedViewController)
        } else if let vc = viewController as? UIViewController {
            if vc.presentedViewController != nil {
                return UIWindow.getVisibleViewControllerFrom(vc.presentedViewController)
            } else {
                return vc
            }
        }
        
        return nil
    }
}