//
//  TagViewController.swift
//  BackPacker
//
//  Created by 심현지 on 2021/02/01.
//

import UIKit

class TagViewController : UIViewController {

    var tags: Array<String>! 
    
    /// 제목
    let titleLabel : UILabel = {
        let label = UILabel()
        label.text = "카테고리"
        return label
    }()
    
    /// 태그 컨테이너
    let collectionView : UICollectionView = {
        let layout = TagFlowLayout()
        layout.scrollDirection = .vertical
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = .white
        view.isScrollEnabled = false

        view.register(TagCollectionViewCell.self, forCellWithReuseIdentifier: TagCollectionViewCell.cellIdentifier)
        return view
    }()
    
    /// 전체 뷰 height constraint constant
    open var viewHeight: CGFloat = 50
    
    /// 크기를 일시적으로 담을 cell
    var sizingCell = TagCollectionViewCell()

    // MARK: viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        collectionView.delegate = self
        collectionView.dataSource = self
          
        self.view.addSubview(titleLabel)
        self.view.addSubview(collectionView)
        
        titleLabel.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20), size: CGSize(width: 0, height: 30))
        collectionView.anchor(top: titleLabel.bottomAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
        
        collectionView.reloadData()
        collectionView.layoutIfNeeded()
        
        viewHeight += collectionView.contentSize.height
    }
}

// MARK: CollectionView Delegate & DataSource

extension TagViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.tags.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = TagCollectionViewCell.dequeueReusableCell(in: collectionView, for: indexPath)
        cell.configure(text: tags[indexPath.row])
        
        return cell
    }
}

extension TagViewController : UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 10, bottom: 20, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        /// 글자를 다 담을만큼 cell을 조절
        self.sizingCell.configure(text: tags[indexPath.row])
        return self.sizingCell.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
    }
}
