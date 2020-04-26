//
//  IconsViewModel.swift
//  CustomIcons
//
//  Created by Bia on 27/03/20.
//  Copyright © 2020 akhaten. All rights reserved.
//

import UIKit

class CatsViewModel: Searchable {
    
    var itemSize: CGSize
     
    var data: [Image] = [] {
        didSet {
            reloadData?()
        }
    }
     
    var reloadData: (() -> Void)?
     
    init(withCellSize size: CGSize) {
        self.itemSize = size
        
        getData()
    }
    
    func cellViewModel(for row: Int) -> CellViewModel {
        let viewModel = CellViewModel(item: data[row])

        return viewModel
    }
    
    func flowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        layout.itemSize = itemSize
        
        return layout
    }
    
    private func getData() {
        
        searchForCats { (pages, error) in
            if let pages = pages {
                
                pages.forEach { page in
                    
                    if let images = page.images {
                        
                        self.data.append(contentsOf: images)
                    }
                }
            } else {
            
                print(error?.localizedDescription as Any)
            }
        }
    }
}
