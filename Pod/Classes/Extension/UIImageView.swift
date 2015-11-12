//
//  UIImageView.swift
//  RainMan
//
//  Created by Nattapong Saengphrom on 9/25/2558 BE.
//  Copyright © 2558 MoreStudio. All rights reserved.
//

import UIKit

public extension UIImageView {
    public func setImage(newImage: UIImage?, animationDuration duration: NSTimeInterval, animationOption: UIViewAnimationOptions) {
        if newImage == nil { return }
        
        UIView.transitionWithView(self,
            duration: duration,
            options: animationOption,
            animations: { self.image = newImage },
            completion: nil)
    }
}