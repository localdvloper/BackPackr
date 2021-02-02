//
//  ScreenshotCollectionViewController.swift
//  BackPacker
//
//  Created by 심현지 on 2021/01/29.
//

import UIKit

class ScreenshotsViewController : UIViewController {
    
    var viewModel : ScreenshotViewModel!
                
    var collectionView : UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = SnapFlowLayout.init()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: view.frame.width, height: view.bounds.height / 2)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(ScreenshotCollectionViewCell.self, forCellWithReuseIdentifier: ScreenshotCollectionViewCell.cellIdentifier)
        collectionView.backgroundColor = .white
        
        collectionView.dataSource = self
        
        self.view.addSubview(collectionView)
    
        collectionView.anchor(top: view.bottomAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
    }
}

extension ScreenshotsViewController : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.urls.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = ScreenshotCollectionViewCell.dequeueReusableCell(in: collectionView, for: indexPath)
        cell.configure(url: viewModel.urls[indexPath.row])
        
        return cell
    }
}
