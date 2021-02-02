//
//  ScreenshotCollectionViewCell.swift
//  BackPacker
//
//  Created by 심현지 on 2021/01/29.
//

import UIKit
import Kingfisher

class ScreenshotCollectionViewCell : UICollectionViewCell, CollectionViewCellReusable {
    
    let imageView : UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        return view
    }()
       
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(imageView)
        imageView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
    
    func configure(url: URL) {
        
        imageView.kf.setImage(with: url)
    }
}
