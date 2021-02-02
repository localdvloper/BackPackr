//
//  TagCollectionViewCell.swift
//  BackPacker
//
//  Created by 심현지 on 2021/02/01.
//

import UIKit

class TagCollectionViewCell : UICollectionViewCell, CollectionViewCellReusable {
    
    let titleLabel : PaddingLabel = {
        let view = PaddingLabel()
        view.layer.borderColor = UIColor.darkGray.cgColor
        view.layer.cornerRadius = 4
        view.layer.borderWidth = 0.5
        view.textColor = .theme
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(titleLabel)
        titleLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0))
        titleLabel.widthAnchor.constraint(lessThanOrEqualToConstant: UIScreen.main.bounds.width - 8*4).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(text: String) {
        self.titleLabel.text = "#\(text)"
    }
}
