//
//  UITextView.swift
//  RainMan
//
//  Created by Tum on 9/10/15.
//  Copyright (c) 2015 MoreStudio. All rights reserved.
//

import UIKit

public extension UITextView {
    public class func sizeOfTextView(text:String?, font:UIFont?, width:CGFloat, lineBreakMode:NSLineBreakMode) -> CGSize {
        if text == nil || font == nil {
            return CGSizeZero
        }
        
        let textView = UITextView(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.max))
        textView.font = font
        textView.text = text
        textView.sizeToFit()
        
        return textView.frame.size
    }
}