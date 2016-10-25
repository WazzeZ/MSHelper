//
//  MSHelper.swift
//  MSHelper
//
//  Created by Tum on 11/12/15.
//  Copyright © 2015 MoreStudio. All rights reserved.
//

import UIKit

open class MSHelper: NSObject {
    
    open static func directoryPath(_ seachPath: FileManager.SearchPathDirectory) -> String? {
        let domainMark = FileManager.SearchPathDomainMask.userDomainMask
        if let dirPath = NSSearchPathForDirectoriesInDomains(seachPath, domainMark, true).first {
            return dirPath
        }
        return nil
    }
    
    open static func cacheDirectoryPath() -> String? {
        let cacheDirectory = FileManager.SearchPathDirectory.cachesDirectory
        return directoryPath(cacheDirectory)
    }
}
