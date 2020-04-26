//
//  IconTableViewCell.swift
//  CustomIcons
//
//  Created by Bia on 27/03/20.
//  Copyright © 2020 akhaten. All rights reserved.
//

import UIKit

class ImageCell: UICollectionViewCell {
    
    private var item: CellViewModel? {
        didSet {
            reloadItem()
        }
    }
    
    private lazy var centerImageView: UIImageView = {
        let imageView = UIImageView(withCornerRadius: 8)
        imageView.backgroundColor = .lightGray
        
        return imageView
    }()
    
    override func prepareForReuse() {
        super.prepareForReuse()

        centerImageView.image = nil
    }
    
    func setupCell(with item: CellViewModel) {
        self.item = item
       
        setupView()
    }
    
    private func reloadItem() {
        
        item?.reloadImage = {
            
            DispatchQueue.main.async {
                self.centerImageView.image = self.item?.image
            }
        }
    }
}

extension ImageCell: ViewCodable {
    
    func buildViewHierarchy() {
        addSubview(centerImageView)
    }
    
    func setupConstraints() {
        centerImageView.fulfillSuperview()
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = .clear
    }
}
