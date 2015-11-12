//
//  MSAvatarImageView.swift
//  Pods
//
//  Created by Tum on 11/12/15.
//
//

import UIKit

public enum MSAvatarViewStyle {
    case Circle
    case Square
    case RoundedSquare(cornerRadius: CGFloat)
}

public class MSAvatarImageView: UIImageView {

    public static var defaultStyle: MSAvatarViewStyle = .Circle
    
    public var style: MSAvatarViewStyle! {
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
    
    private func commonInit() {
        self.layer.masksToBounds = true
        
        if self.style == nil {
            self.style = MSAvatarImageView.defaultStyle
        }
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        
        switch self.style! {
        case .Circle:
            self.layer.cornerRadius = self.bounds.height / 2
        case .Square:
            self.layer.cornerRadius = 0
        case .RoundedSquare(let cornerRadius):
            self.layer.cornerRadius = cornerRadius
        }
    }
}
