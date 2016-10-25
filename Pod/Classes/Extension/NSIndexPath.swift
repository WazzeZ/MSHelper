//
//  NSIndexPath.swift
//  RainMan
//
//  Created by Tum on 9/16/15.
//  Copyright (c) 2015 MoreStudio. All rights reserved.
//

import UIKit

public extension IndexPath {
    public func isEqual(row: Int, section: Int)-> Bool {
        return self.row == row && self.section == section
    }
}
