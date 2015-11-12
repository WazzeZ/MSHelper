//
//  MSHelper.swift
//  MSHelper
//
//  Created by Tum on 11/12/15.
//  Copyright © 2015 MoreStudio. All rights reserved.
//

import UIKit

class MSHelper: NSObject {
    
    class func directoryPath(seachPath: NSSearchPathDirectory) -> String? {
        let domainMark = NSSearchPathDomainMask.UserDomainMask
        if let dirPath = NSSearchPathForDirectoriesInDomains(seachPath, domainMark, true).first {
            return dirPath
        }
        return nil
    }
    
    class func cacheDirectoryPath() -> String? {
        let cacheDirectory = NSSearchPathDirectory.CachesDirectory
        return directoryPath(cacheDirectory)
    }
}
