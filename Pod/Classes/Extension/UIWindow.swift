//
//  UIWindow.swift
//  MSHelper
//
//  Created by Tum on 11/12/15.
//  Copyright © 2015 MoreStudio. All rights reserved.
//

import Foundation

public extension UIWindow {
    public func visibleViewController()-> UIViewController? {
        return UIWindow.getVisibleViewControllerFrom(self.rootViewController)
    }
    
    public class func getVisibleViewControllerFrom(_ viewController: AnyObject?)-> UIViewController? {
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
