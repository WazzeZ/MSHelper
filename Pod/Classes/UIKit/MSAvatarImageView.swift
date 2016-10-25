//
//  MSAvatarImageView.swift
//  Pods
//
//  Created by Tum on 11/12/15.
//
//

import UIKit

public enum MSAvatarViewStyle {
    case circle
    case square
    case roundedSquare(cornerRadius: CGFloat)
}

open class MSAvatarImageView: UIImageView {
    
    open static var defaultStyle: MSAvatarViewStyle = .circle
    
    open var style: MSAvatarViewStyle! {
        didSet {
            self.layoutSubviews()
        }
    }
    
    // MARK: -
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    override public init(image: UIImage?) {
        super.init(image: image)
        self.commonInit()
    }
    
    override public init(image: UIImage?, highlightedImage: UIImage?) {
        super.init(image: image, highlightedImage: highlightedImage)
        self.commonInit()
    }
    
    fileprivate func commonInit() {
        self.layer.masksToBounds = true
        
        if self.style == nil {
            self.style = MSAvatarImageView.defaultStyle
        }
    }
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        
        switch self.style! {
        case .circle:
            self.layer.cornerRadius = self.bounds.height / 2
        case .square:
            self.layer.cornerRadius = 0
        case .roundedSquare(let cornerRadius):
            self.layer.cornerRadius = cornerRadius
        }
    }
}
