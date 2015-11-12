//
//  MSHelper.swift
//  MSHelper
//
//  Created by Tum on 11/12/15.
//  Copyright © 2015 MoreStudio. All rights reserved.
//

import UIKit

public class MSHelper: NSObject {
    
    public static func directoryPath(seachPath: NSSearchPathDirectory) -> String? {
        let domainMark = NSSearchPathDomainMask.UserDomainMask
        if let dirPath = NSSearchPathForDirectoriesInDomains(seachPath, domainMark, true).first {
            return dirPath
        }
        return nil
    }
    
    public static func cacheDirectoryPath() -> String? {
        let cacheDirectory = NSSearchPathDirectory.CachesDirectory
        return directoryPath(cacheDirectory)
    }
}
