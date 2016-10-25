//
//  NSTimer.swift
//  MoreHelper
//
//  Created by Tum on 9/3/15.
//  Copyright (c) 2015 MoreStudio. All rights reserved.
//

import UIKit

public extension Timer {
    public class func schedule(delay: Double, task: @escaping ()-> Void) {
        let dispatchTime: DispatchTime = DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
        DispatchQueue.main.asyncAfter(deadline: dispatchTime, execute: task)
    }
}
