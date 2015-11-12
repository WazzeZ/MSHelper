//
//  NSTimer.swift
//  MoreHelper
//
//  Created by Tum on 9/3/15.
//  Copyright (c) 2015 MoreStudio. All rights reserved.
//

import UIKit

extension NSTimer {
    class func schedule(delay delay: Double, task: dispatch_block_t) {
        let delay = delay * Double(NSEC_PER_SEC)
        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        dispatch_after(time, dispatch_get_main_queue(), task)
    }
}
