//
//  String.swift
//  MSHelper
//
//  Created by Tum on 11/12/15.
//  Copyright © 2015 MoreStudio. All rights reserved.
//

import Foundation

public extension String {
    public var length: Int {
        return self.characters.count
    }
    
    public var objcLength: Int {
        return self.utf16.count
    }
}

public extension String {
    public var lastPathComponent: String {
        get {
            return (self as NSString).lastPathComponent
        }
    }
    
    public var pathExtension: String {
        get {
            return (self as NSString).pathExtension
        }
    }
    
    public var stringByDeletingLastPathComponent: String {
        get {
            
            return (self as NSString).deletingLastPathComponent
        }
    }
    
    public var stringByDeletingPathExtension: String {
        get {
            return (self as NSString).deletingPathExtension
        }
    }
    public var pathComponents: [String] {
        get {
            return (self as NSString).pathComponents
        }
    }
    
    public func stringByAppendingPathComponent(path: String) -> String {
        let nsSt = self as NSString
        return nsSt.appendingPathComponent(path)
    }
    
    public func stringByAppendingPathExtension(ext: String) -> String? {
        let nsSt = self as NSString
        return nsSt.appendingPathExtension(ext)
    }
}

public extension String {
    public func isEmail() -> Bool {
        //        let emailRegex = "(?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}\"@\"~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\\"@\"x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-\"@\"z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5\"@\"]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-\"@\"9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\"@\"-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        let validate = emailTest.evaluate(with: self)
        return validate
    }
    
    public func isAbsoluteEmpty()-> Bool {
        if self.isEmpty {
            return true
        }
        if self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            return true
        }
        return false
    }
    
    public func isPhoneNumber()throws -> Bool {
        if self.characters.count < 9 || self.characters.count > 10 {
            return false
        }
        
        do {
            let detector = try NSDataDetector(types: NSTextCheckingResult.CheckingType.phoneNumber.rawValue)
            let inputRange = NSMakeRange(0, self.length)
            let matches = detector.matches(in: self, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: inputRange)
            
            if matches.count == 0 {
                return false
            }
            
            if let result = matches.first {
                if result.resultType == NSTextCheckingResult.CheckingType.phoneNumber && result.range.location == inputRange.location && result.range.length == inputRange.length {
                    return true
                } else {
                    return false
                }
            }
        } catch let error {
            throw error
        }
        
        return false
    }
    
    public func getPhones()throws -> [String] {
        do {
            let detector = try NSDataDetector(types: NSTextCheckingResult.CheckingType.phoneNumber.rawValue)
            let inputRange = NSMakeRange(0, self.characters.count)
            _ = detector.matches(in: self, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: inputRange)
            detector.enumerateMatches(in: self, options: [], range: NSMakeRange(0, self.length)) { (result, flags, _) in
                print(result)
            }
        } catch let error {
            throw error
        }
        
        return []
    }
}
