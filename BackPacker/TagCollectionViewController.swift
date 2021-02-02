//
//  TagCollectionViewController.swift
//  BackPacker
//
//  Created by 심현지 on 2021/02/01.
//

import UIKit

class TagViewController : UICollectionViewController {

    var sizingCell: TagCollectionViewCell!

    var tags: Array<String>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
//        collectionView.isScrollEnabled = false

        collectionView.register(TagCollectionViewCell.self, forCellWithReuseIdentifier: TagCollectionViewCell.cellIdentifier)
        collectionView.register(TagCollectionViewHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "headerView")

        self.sizingCell = TagCollectionViewCell()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.tags.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = TagCollectionViewCell.dequeueReusableCell(in: collectionView, for: indexPath)
        cell.configure(text: tags[indexPath.row])
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "headerView", for: indexPath) as! TagCollectionViewHeaderView

        headerView.backgroundColor = .theme
        headerView.label.text = "카테고리"

        return headerView
    }
    
}

extension TagViewController : UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 10, bottom: 20, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        self.sizingCell.configure(text: tags[indexPath.row])
        return self.sizingCell.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
//        let indexPath = IndexPath(row: 0, section: section)
//        let headerView = self.collectionView(collectionView, viewForSupplementaryElementOfKind: UICollectionView.elementKindSectionHeader, at: indexPath)
//
//        return headerView.systemLayoutSizeFitting(CGSize(width: collectionView.frame.width, height: 50), withHorizontalFittingPriority: .required, verticalFittingPriority: .fittingSizeLevel)
        
        
        let width: CGFloat = UIScreen.main.bounds.width
        let height: CGFloat = 50
        return CGSize(width: width, height: height)
    }

}
