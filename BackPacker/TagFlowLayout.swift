//
//  TagFlowLayout.swift
//  BackPacker
//
//  Created by 심현지 on 2021/02/01.
//

import UIKit

class TagFlowLayout : UICollectionViewFlowLayout {
        
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        let attributes = super.layoutAttributesForElements(in: rect)

        var leftMargin = sectionInset.left
        var maxY: CGFloat = -1.0

        attributes?.forEach { layoutAttribute in
            
            /// maxY 값보다 셀의 Y값이 더 밑에 있으면 leftMargin은 맨 왼쪽으로 넘어감.
            if layoutAttribute.frame.origin.y >= maxY {
                leftMargin = sectionInset.left
            }

            /// 셀의 X값은 leftMargin으로 변경한다.
            layoutAttribute.frame.origin.x = leftMargin

            /// leftMargin에 셀의 너비와 패딩을 더함.
            leftMargin += layoutAttribute.frame.width + minimumInteritemSpacing
            
            /// maxY값은 셀의 maxY값과 계산된 maxY값 중 큰 값
            maxY = max(layoutAttribute.frame.maxY , maxY)
        }
        return attributes
    }
}

