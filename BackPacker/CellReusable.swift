//
//  CellReusable.swift
//  Pixo
//
//  Created by 심현지 on 2021/01/27.
//

import UIKit

/**
 Cell Reusable Protocol & Extension
 */
/// Collection View Cell protocol
protocol CollectionViewCellReusable {
    associatedtype CellType : UICollectionViewCell = Self
    
    /// reuse identifier
    static var cellIdentifier : String { get }
    
    /// Cell 재사용 호출 함수
    static func dequeueReusableCell(in collectionView : UICollectionView, for indexPath: IndexPath) -> CellType
}

extension CollectionViewCellReusable where Self : UICollectionViewCell {
    
    static var cellIdentifier : String {
        return String(describing: Self.self)
    }

    static func dequeueReusableCell(in collectionView : UICollectionView, for indexPath: IndexPath) -> CellType {
        return collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! CellType
    }
}


/// Table View Cell protocol
protocol TableViewCellReusable {
    associatedtype CellType : UITableViewCell = Self
    
    /// reuse identifier
    static var cellIdentifier : String { get }
    
    /// Cell 재사용 호출 함수
    static func dequeueReusableCell(in tableView : UITableView, for indexPath: IndexPath) -> CellType
}

extension TableViewCellReusable where Self : UITableViewCell {
    
    static var cellIdentifier : String {
        return String(describing: Self.self)
    }

    static func dequeueReusableCell(in tableView : UITableView, for indexPath: IndexPath) -> CellType {
        return tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CellType
    }
}
