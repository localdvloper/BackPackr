//
//  TagLabel.swift
//  BackPacker
//
//  Created by 심현지 on 2021/02/01.
//

import UIKit

class PaddingLabel : UILabel {
    
    let margin : CGFloat = 8
    
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: margin, left: margin, bottom: margin, right: margin)
        super.drawText(in: rect.inset(by: insets))
    }

    override var intrinsicContentSize: CGSize {
        
        let size = super.intrinsicContentSize
        size.width += self.alignmentRectInsets.left + self.alignmentRectInsets
        CGSize size = [super intrinsicContentSize];
            size.width  += self.edgeInsets.left + self.edgeInsets.right;
            size.height += self.edgeInsets.top + self.edgeInsets.bottom;
        return
    }
}
