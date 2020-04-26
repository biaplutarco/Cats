//
//  IconsView.swift
//  CustomIcons
//
//  Created by Bia on 27/03/20.
//  Copyright © 2020 akhaten. All rights reserved.
//

import UIKit

class ListView: UIView {
    
    var viewModel: CatsViewModel 
    
    private lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: viewModel.flowLayout())
        collectionView.registerCell(of: ImageCell.self)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        
        return collectionView
    }()
    
    init(viewModel: CatsViewModel) {
        self.viewModel = viewModel
        
        super.init(frame: CGRect.zero)
        
        setupView()
        reloadData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func reloadData() {
        
        viewModel.reloadData = {
           
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
}

extension ListView: ViewCodable {
    
    func buildViewHierarchy() {
        addSubview(collectionView)
    }
    
    func setupConstraints() {
        collectionView.fulfillSuperview()
    }
    
    func setupAdditionalConfiguration() { }
}

extension ListView: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueCell(of: ImageCell.self, forIndexPath: indexPath)
        
        cell.setupCell(with: viewModel.cellViewModel(for: indexPath.row))
        
        return cell
    }
}
