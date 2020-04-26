//
//  UITableView+Dequeue+Register.swift
//  Cats
//
//  Created by Bia on 25/04/20.
//  Copyright © 2020 akhaten. All rights reserved.

import UIKit

extension UICollectionViewCell {
    
    static var identifier: String {
        
        return String(describing: self)
    }
}

extension UICollectionView {
    
    func dequeueCell<T: UICollectionViewCell>(of type: T.Type, forIndexPath indexPath: IndexPath) -> T {
    
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: T.identifier, for: indexPath) as? T
            else {
            
            fatalError("CollectionViewCell wasn't registered")
        }

        return cell
    }
    
    func registerCell<T: UICollectionViewCell>(of type: T.Type) {
        
        self.register(T.self, forCellWithReuseIdentifier: T.identifier)
    }
    
}
