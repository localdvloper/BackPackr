//
//  ScreenshotsViewController.swift
//  BackPacker
//
//  Created by 심현지 on 2021/01/29.
//

import UIKit

/// 상단 이미지 스크롤 뷰
class ScreenshotsViewController : UICollectionViewController {
      
    var imageURLs : Array<URL> {
        didSet {
            collectionView.reloadData()
        }
    }
    
    init(data: ITunesData) {
        
        let layout = SnapFlowLayout.init()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2)
        
        self.imageURLs = data.screenshotUrls.compactMap { URL(string: $0) }
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        
        collectionView.register(ScreenshotCollectionViewCell.self, forCellWithReuseIdentifier: ScreenshotCollectionViewCell.cellIdentifier)
        collectionView.reloadData()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageURLs.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = ScreenshotCollectionViewCell.dequeueReusableCell(in: collectionView, for: indexPath)
        cell.configure(url: imageURLs[indexPath.row])
        
        return cell
    }
}
