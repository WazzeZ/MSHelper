//
//  MHLabelExtension.swift
//  MoreHelper
//
//  Created by Tum on 9/3/15.
//  Copyright (c) 2015 MoreStudio. All rights reserved.
//

import UIKit

public extension UILabel {
    public class func sizeOfText(text:String?, font:UIFont?, width:CGFloat, lineBreakMode:NSLineBreakMode, numberOfLines:Int) -> CGSize {
        if text == nil || font == nil {
            return CGSizeZero
        }
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.max))
        label.numberOfLines = numberOfLines
        label.lineBreakMode = lineBreakMode
        label.font = font
        label.text = text
        label.sizeToFit()
        
        return label.frame.size
    }
    
    public class func sizeOfAttributedText(attributedText: NSAttributedString?, font:UIFont?, width:CGFloat, lineBreakMode:NSLineBreakMode, numberOfLines:Int) -> CGSize {
        if attributedText == nil || font == nil {
            return CGSizeZero
        }
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.max))
        label.numberOfLines = numberOfLines
        label.lineBreakMode = lineBreakMode
        label.font = font
        label.attributedText = attributedText
        label.sizeToFit()
        
        return label.frame.size
    }
}

